import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
// import 'package:filesystem_picker/filesystem_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:mobile_popup/mobile_popup.dart';
import 'package:mobile_popup/pop_up.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sm_service/AppScreens/Listview/ListView.dart';
import 'package:sm_service/AppScreens/Searchable_List/seacrhableListview.dart';
import 'package:sm_service/AppScreens/TimeLine/TimeLineScreen.dart';
import 'package:sm_service/App_Initialization/App_classes/BottomBar.dart';
import 'package:sm_service/App_Initialization/App_classes/DropDowns.dart';
import 'package:sm_service/App_Initialization/App_classes/PopularFilterListData.dart';
import 'package:sm_service/App_Initialization/App_classes/Tab_Icons.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sm_service/DataStructures/DropDown_Master.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_1.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_2.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_3.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_4.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_5.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlattenttrx_Status.dart';

import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/Database_Files/Updating_All_DB.dart';
import 'package:hexcolor/hexcolor.dart';

class Absence_Body extends StatefulWidget {
  Absence_Body(this.th, this.screentype, this.parent, this.mobid);
  theme th;
  Screen_type screentype;
  var parent;
  String mobid;

  @override
  _Absence_BodyState createState() => _Absence_BodyState();
}

class _Absence_BodyState extends State<Absence_Body> {
  DropDown_1 dropDown_1 = DropDown_1();
  DropDown_2 dropDown_2 = DropDown_2();
  DropDown_3 dropDown_3 = DropDown_3();
  DropDown_4 dropDown_4 = DropDown_4('1'); //TODO HARD CODED
  DropDown_5 dropDown_5 = DropDown_5(); //TODO HARD CODED

  DropDowns dropDowns;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  Map snapshot; //DATA OF CURRENT TRX

  var txt1 = TextEditingController();
  var txt2 = TextEditingController();
  var cash = TextEditingController(text: "0");
  var msgtxtxtrl = TextEditingController();
  bool ishourly = false;
  int l = 0;
  List<PopularFilterListData> popularFilterListData =
      PopularFilterListData.popularFList;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  bool isloading = false;
  assignBottomIcon() {
    if (widget.screentype == Screen_type.Pending_Request) {

      tabIconsList = TabIconData.tabIconsListforpending;
    } else {


      tabIconsList = TabIconData.tabIconsList;
    }

    popularFilterListData.forEach((element) {
      element.isSelected = false;
    });
  }

  final absence_Transaction = Absence_Transaction.instance;
  String rejoiningDatevar = '';

  @override
  void setState(fn) {
    // TODO: implement setState

  }

  @override
  void initState() {
    if (widget.screentype == Screen_type.Pending_Request) {

      tabIconsList = TabIconData.tabIconsListforpending;
    } else {



      tabIconsList = TabIconData.tabIconsList;
    }

    dropDowns =
        DropDowns(dropDown_1, dropDown_2, dropDown_3, dropDown_4, dropDown_5);
    assignBottomIcon();
  }

  initialise_Vaiables() async {
    if (widget.screentype == Screen_type.Absence_Request) {
      return await initialise_absence();
    }
    if (widget.screentype == Screen_type.Saved_Request) {
      return await initialise_saved();
    }
    if (widget.screentype == Screen_type.Pending_Request) {
      return await initialise_pending();
    }
    if (widget.screentype == Screen_type.Submitted_Request) {
      return await initialise_submitted();
    }
    return null;
  }

  initialise_absence() async {
    var recidemploymaster = await dropDowns.dropDown_1.setForDefault(uid);
    var emprecidlvtidd2Forfilter4 =
        await dropDowns.dropDown_2.setForDefault(recidemploymaster);
    await dropDowns.dropDown_3
        .setForDefault(dropDowns.dropDown_1.empid, emprecidlvtidd2Forfilter4);
    await dropDowns.dropDown_4.setForDefault();
    return 2;
  }

  initialise_saved() async {
    return await setvarables_FROM_TRANSACTION_TABLE();
  }

  initialise_pending() async {
    return await setvarables_FROM_TRANSACTION_TABLE();
  }

  initialise_submitted() async {
    return await setvarables_FROM_TRANSACTION_TABLE();
  }

  valis_2_or_3() {
    return true;
  }

  setvarables_FROM_TRANSACTION_TABLE() async {
    // List ls = await getPENDINGRECORDS();
    List ls = await absence_Transaction.queryonlyRows(
        widget.mobid, Absence_Transaction.mobid);

    ls.forEach((element) {
      if (element[Absence_Transaction.mobid] == widget.mobid)
        snapshot = element;
    });

    startDate =
        DateTime.parse(snapshot['${Absence_Transaction.fromDate}'].toString());
    endDate =
        DateTime.parse(snapshot['${Absence_Transaction.toDate}'].toString());
    if(snapshot['${Absence_Transaction.hourly}']  == 1 )
    ishourly =  true;

    txt1.text = snapshot['${Absence_Transaction.remarks1}'].toString();
    txt2.text = snapshot['${Absence_Transaction.remarks2}'].toString();

    cash.text = snapshot['${Absence_Transaction.cashAmount}'].toString();
//    startDate.add(Duration(hours:   ,minutes:  ,seconds: ));


    if (snapshot['${Absence_Transaction.leaveSalary}'] == 1) {
      popularFilterListData[3].isSelected = true;
    } else {
      popularFilterListData[3].isSelected = false;
    }

    if (snapshot['${Absence_Transaction.cashCheck}'] == 1) {
      popularFilterListData[2].isSelected = true;
    } else {
      popularFilterListData[2].isSelected = false;
    }

    if (snapshot['${Absence_Transaction.perDiem}'] == 1) {
      popularFilterListData[1].isSelected = true;
    } else {
      popularFilterListData[1].isSelected = false;
    }
    if (snapshot['${Absence_Transaction.airTicket}'] == 1) {
      popularFilterListData[0].isSelected = true;
    } else {
      popularFilterListData[0].isSelected = false;
    }

    rejoiningDatevar =
        snapshot['${Absence_Transaction.rejoiningDate}'].toString();

    // startDate = DateTime.parse(snapshot['${Absence_Transaction.fromTime}'].toString());
    // endDate =  DateTime.parse(snapshot['${Absence_Transaction.toTime}'].toString());

// print(snapshot['${Absence_Transaction.fromTime}'].toString() );
    //startDate.add(  getdurationForTime(snapshot['${Absence_Transaction.fromTime}'].toString() ));
    //  endDate.add(  getdurationForTime(snapshot['${Absence_Transaction.toTime}'].toString() ));

    var a = await dropDowns.dropDown_1.setValuesby_Empid(
        snapshot['${Absence_Transaction.employeeIDD}'].toString());

    dropDowns.dropDown_2.DropDownCode =
        snapshot['${Absence_Transaction.LeaveCodeIDD}'].toString();
    dropDowns.dropDown_2.DropDownValue =
        snapshot['${Absence_Transaction.LeaveCode}'].toString();

    dropDowns.dropDown_3.DropDownCode =
        snapshot['${Absence_Transaction.leaveTypeIDD}'].toString();
    dropDowns.dropDown_3.DropDownValue =
        snapshot['${Absence_Transaction.leaveTypeCode}'].toString();

    //   var b=    await dropDowns.dropDown_2.setValuesby_RecordID(  snapshot['${Absence_Transaction.leaveTypeIDD}'].toString()) ;

    // var c=  await dropDowns.dropDown_3.setValuesby_LeaveCodeID(  snapshot['${Absence_Transaction.LeaveCodeIDD}'].toString()) ;

    var d = await dropDowns.dropDown_4
        .setValues(snapshot['${Absence_Transaction.entryType}'].toString());


    return a.toString() /*+b.toString()+c.toString()*/ + d.toString();
  }

  @override
  Widget build(BuildContext context) {
    Widget gettextbox(str) {
      final PopularFilterListData date =
          PopularFilterListData(isSelected: ishourly, titleTxt: str);
      return Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          onTap: () {
            widget.parent.setState(() {
//  widget.parent.setState(() {
              ishourly = !ishourly;

//});
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  ishourly ? Icons.check_box : Icons.check_box_outline_blank,
                  color: ishourly
                      ? widget.th.pr
                      : Color(0x4A8EFE).withOpacity(0.6),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  date.titleTxt,
                  style: TextStyle(color: widget.th.pr),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget rejFormclock(str, str2, int a) {
      if (a == 0)
        return Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 3),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              widget.parent.setState(() {
//          checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  DateTimeRangePicker(
                      startText: "From",
                      endText: "To",
                      doneText: "OK",
                      cancelText: "Cancel",
                      interval: 5,
                      initialStartTime: startDate,
                      initialEndTime: startDate,
                      mode: DateTimeRangePickerMode.date,
//                  minimumTime: startDate,
//                              maximumTime: endDate.ad,
                      onConfirm: (start, end) {
                        widget.parent.setState(() {
                          startDate = start;
                          endDate = end;
                        });
                      }).showPicker(context);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        str,
                        style: TextStyle(color: widget.th.pr),
                      ),
                    ),
                    Column(
                      children: [
                        Container(height: 50,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            str2,
                            style: TextStyle(
                                color: widget.th.pr, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      else if (a == 1) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 3),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              widget.parent.setState(() {
//          checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  DateTimeRangePicker(
                      startText: "From",
                      endText: "To",
                      doneText: "OK",
                      cancelText: "Cancel",
                      interval: 5,
                      initialStartTime: startDate,
                      initialEndTime: startDate,
                      mode: DateTimeRangePickerMode.time,
//                  minimumTime: startDate,
//                              maximumTime: endDate.ad,
                      onConfirm: (start, end) {
                        widget.parent.setState(() {
                          startDate = start;
                          endDate = end;
                        });

                      }).showPicker(context);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        str,
                        style: TextStyle(color: widget.th.pr),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          str2,
                          style: TextStyle(
                              color: widget.th.pr, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
    Widget formclock(str, startTime,endTime, int a) {
      if (a == 0)
        return Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 3),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              widget.parent.setState(() {
//          checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  DateTimeRangePicker(
                      startText: "From",
                      endText: "To",
                      doneText: "OK",
                      cancelText: "Cancel",
                      interval: 5,
                      initialStartTime: startDate,
                      initialEndTime: startDate,
                      mode: DateTimeRangePickerMode.date,
//                  minimumTime: startDate,
//                              maximumTime: endDate.ad,
                      onConfirm: (start, end) {
                        widget.parent.setState(() {
                          startDate = start;
                          endDate = end;
                        });
                      }).showPicker(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        str,
                        style: TextStyle(color: widget.th.pr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child:Row(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: [
                          Text(startTime,
                              style: TextStyle(
                                color:HexColor(blueTextcol), fontWeight: FontWeight.w500,)

                          ),


                          Text('to',
                              style: TextStyle(
                                color:widget.th.pr, fontWeight: FontWeight.w500,)

                          ),

                          Text(endTime,
                              style: TextStyle(
                                color:HexColor(blueTextcol), fontWeight: FontWeight.w500,)

                          ),

                        ],
                      )

                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      else if (a == 1) {
        return Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 3),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              widget.parent.setState(() {
//          checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  DateTimeRangePicker(
                      startText: "From",
                      endText: "To",
                      doneText: "OK",
                      cancelText: "Cancel",
                      interval: 5,
                      initialStartTime: startDate,
                      initialEndTime: startDate,
                      mode: DateTimeRangePickerMode.time,
//                  minimumTime: startDate,
//                              maximumTime: endDate.ad,
                      onConfirm: (start, end) {
                        widget.parent.setState(() {
                          startDate = start;
                          endDate = end;
                        });

                      }).showPicker(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        str,
                        style: TextStyle(color: widget.th.pr),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child:Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            Text(startTime,
                                style: TextStyle(
                                  color:HexColor(blueTextcol), fontWeight: FontWeight.w500,)

                            ),


                            Text('to',
                                style: TextStyle(
                                  color:widget.th.pr, fontWeight: FontWeight.w500,)

                            ),

                            Text(endTime,
                                style: TextStyle(
                                  color:HexColor(blueTextcol), fontWeight: FontWeight.w500,)

                            ),

                          ],
                        )

                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }

    List<Widget> getPList() {
      final List<Widget> noList = <Widget>[];
      int count = 0;
      const int columnCount = 2;
      for (int i = 0; i < popularFilterListData.length / columnCount; i++) {
        final List<Widget> listUI = <Widget>[];
        for (int i = 0; i < columnCount; i++) {
          try {
            PopularFilterListData date = popularFilterListData[count];
            listUI.add(Expanded(
              child: Row(
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      onTap: () {
                        widget.parent.setState(() {
                          date.isSelected = !date.isSelected;
                          if (!popularFilterListData[2].isSelected) {
                            cash.text = '0';
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              popularFilterListData[count].isSelected
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: popularFilterListData[count].isSelected
                                  ? widget.th.pr
                                  : Colors.grey.withOpacity(0.6),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              popularFilterListData[count].titleTxt,
                              style: TextStyle(color: widget.th.pr),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
            count += 1;
          } catch (e) {
            print(e);
          }
        }
        noList.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: listUI,
        ));
      }
      return noList;
    }

    Widget div() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Divider(
          thickness: 2,
          height: 2,
          color: Colors.grey,
        ),
      );
    }

    Widget textboxrow(str, num, input) {
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 3),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          onTap: () {
            widget.parent.setState(() {
//          checkAppPosition(i);
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    str,
                    style: TextStyle(color: widget.th.pr),
                  ),
                ),
                Container(
                  width: 40,
                ),
                Expanded(
                    child: Theme(
                  data: new ThemeData(
                    // primaryColor: Colors.redAccent,
                    // primaryColorDark: Colors.red,
                  ),
                  child: new TextField(
                    style: TextStyle(color: widget.th.pr),
                    keyboardType: input,
                    controller: num == 1
                        ? cash
                        : num == 2 ? txt1 : num == 3 ? txt2 : msgtxtxtrl,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: widget.th.pr)),
                        hintText: '',
                        helperText: '',
                        labelText: '',
//                        prefixIcon: const Icon(
//                          Icons.person,
//                          color: Colors.green,
//                        ),
                        prefixText: ' ',
                        suffixText: '',
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                )),
              ],
            ),
          ),
        ),
      );
    }

    Widget bottomBar() {
      return Column(
        children: <Widget>[
          const Expanded(
            child: SizedBox(),
          ),
          //TODO BOTTOM BAR
          BottomBarView(

            tabIconsList: tabIconsList,
            addClick: () {
              print('dedede');
//            RESET_SCREEN();
            },
            changeIndex: (int index) async {
              if ((index == 0 || index == 1) && isNotselected()) {
                return await Alert(
                        context: context,
                        title: "ERROR",
                        desc: 'Select All the drop downs')
                    .show();
              } else {
                widget.parent.setState(() {
                  isloading = true;
                });
                if (index == 0) {
                  if (Screen_type.Pending_Request == widget.screentype) {
                    Approve_pending_request();
                  } else {
                    String mobid = Random().nextInt(1000000).toString() +
                        DateTime.now().millisecondsSinceEpoch.toString() +
                        dropDowns.dropDown_1.recidemploymaster.toString();

                    if (startDate.isAfter(endDate)) {
                      var temp = startDate;
                      endDate = temp;
                      startDate = endDate;
                    }

                    insering_allDB dbvar = insering_allDB();
                    bool perDiem = popularFilterListData[1].isSelected;
                    await saveTolocal(dbvar, mobid, perDiem, "Saved");

                    return await showDialog(
                      context: this.context,
                      child: new AlertDialog(
                        content: new FlatButton(
                          child: new Text("Saved"),
                          onPressed: () => Navigator.pop(context, true),
                        ),
                      ),
                    );
                  }
                }
                if (index == 1) {
                  if (widget.screentype == Screen_type.Pending_Request) {


                    var t = await Reject_pending_request();


                  } else {
                    bool c = await checkServerConnection(GetEmployees, id, pas);

                    if (!c) {
                      isloading = false;
                      return await Alert(
                              context: context,
                              title: "ERROR",
                              desc:
                                  'AP100-Connectivity Issue Please Contact Support.')
                          .show();
                    }


                    String mobid = Random().nextInt(1000000).toString() +
                        DateTime.now().millisecondsSinceEpoch.toString() +
                        dropDowns.dropDown_1.recidemploymaster.toString();

                    insering_allDB dbvar = insering_allDB();
                    bool airTick = popularFilterListData[0].isSelected;
                    bool perDiem = popularFilterListData[1].isSelected;
                    bool absenceSal = popularFilterListData[2].isSelected;
                    bool AdvanceCash = popularFilterListData[3].isSelected;

                    print(popularFilterListData[0].isSelected);
                    print(popularFilterListData[1].isSelected);
                    print(popularFilterListData[2].isSelected);
                    print(popularFilterListData[3].isSelected);
                    print("Hours" +
                        startDate.difference(endDate).abs().inHours.toString());
                    print("Min" +
                        startDate
                            .difference(endDate)
                            .abs()
                            .inMinutes
                            .toString());

                    saveTolocal(dbvar, mobid, perDiem, "ReadyToSubmit");

//SAVED TO LOCAL

                    http.Response a =
                        await SendAbsenceRequesttoServer("", mobid);
                    print(a.statusCode);

                    print(a.body);

                    if (a.body.contains('ERROR') == true) {
                      Alert(context: context, title: "ERROR", desc: a.body)
                          .show();
                    } else {
//  InsertedAbsenceTransaction(mobid);
                      Alert(context: context, title: "Submitted", desc: a.body)
                          .show();
                      print('Inserted');
                      Eb_prllevtrx_status eb_prllevtrx_status =
                          Eb_prllevtrx_status.instance;

                      Map ls = await InsertedAbsenceTransaction(mobid);
                      print(ls);
                      Map d = {
                        "${Absence_Transaction.recordIDD}": ls['RecordIDD'],
                        "${Absence_Transaction.rejoiningDate}":
                            ls['RejoiningDate'],
                        "${Absence_Transaction.transactionNumber}":
                            ls['TransactionNumber'],
                        "${Absence_Transaction.LeaveCode}": ls['Leavecode'],
                        "${Absence_Transaction.leaveTypeCode}": ls['RecordIDD'],
                        "${Absence_Transaction.calendarDays}":
                            ls['CalendarDays'],
                        "${Absence_Transaction.weekendDays}": ls['WeekendDays'],
                        "${Absence_Transaction.holidays}": ls['Holidays'],
                        "${Absence_Transaction.EmployeeUserID}":
                            ls['Employeeuserid'],
                        "${Absence_Transaction.WorkflowMasterID}":
                            ls['WorkflowMasterID'],
                        "${Absence_Transaction.SubmittedByUserID}":
                            ls['Submittedbyuserid'],
                        "${Absence_Transaction.Status}": ls['Status'],
                        "${Absence_Transaction.NumberOfDays}":
                            ls['NumberOfDays'],
                        "${Absence_Transaction.WorkflowMasterID}":
                            ls['WorkflowMasterID'],
                        "${Absence_Transaction.syncstatus}": 1,
                        "${Absence_Transaction.syncdate}":
                            DateTime.now().millisecondsSinceEpoch,
                        "${Absence_Transaction.operation}": 'Inserted',
                      };

                      int res = await absence_Transaction.update(
                          Map<String, dynamic>.from(d), mobid);

                      print("result*" + res.toString());

                      List statusTable =
                          await InsertAbsenceTransactionStatus(mobid);

                      await eb_prllevtrx_status.delete(
                          Eb_prllevtrx_status.mobid,
                          statusTable.first['mobid']);

                      statusTable.forEach((element) {
                        print("STATUS TABLE :");
                        print(element);

                        dbvar.insert_Eb_prllevtrx_status(
                            syncstatus: 1,
                            operation: 'Inserted',
                            syncdate: DateTime.now().millisecondsSinceEpoch,
                            WorkflowMasterID: element['WorkflowMasterID'],
                            mobid: mobid,
                            Company: element['Company'],
                            cmpidd: element['cmpidd'],
                            ApprovedByUserID: element['ApprovedByUserID'],
                            approvingline: element['groupcoode'],
                            groupcode: element['WorkflowMasterID'],
                            groupidd: element['groupidd'],
                            ID: element['ID'],
                            LeaveTransactionID: element['levelversion'],
                            levelcolor: element['levelcolor'],
                            levelversion: element['levelversion'],
                            MainApproverUserID: element['MainApproverUserID'],
                            MappingType: element['MappingType'],
                            Processed: element['Processed'],
                            ProcessedDate: element['ProcessedDate'],
                            Remarks: element['Remarks'],
                            RequestStatusID: element['RequestStatusID'],
                            seq: element['seq'],
                            tag: element['tag'],
                            Transremarks: element['Transremarks'],
                            UpdateDate: element['UpdateDate'],
                            UserLevel: element['UserLevel'],
                            VoidedOnRecall: element['VoidedOnRecall'],
                            WorkflowID: element['WorkflowID'],
                            ApprovedByUserIDName: element[
                                Eb_prllevtrx_status.ApprovedByUserIDName],
                            MainApproverUserIDName: element[
                                Eb_prllevtrx_status.MainApproverUserIDName]);
                      });

                      print('inserted');
                      //Sync =1
                      //o   Syncdate = current date
                      //o   Operation = “Updated”

                    }
                  }
                }
                if (index == 2) {
print('dsds');
                  if (widget.screentype == Screen_type.Pending_Request) {

                    return Revise_pending_request();

                  } else if(widget.screentype == Screen_type.Absence_Request){
                    print('rere');
                    final path = await FlutterDocumentPicker.openDocument();

              FlutterDocumentPickerParams params = FlutterDocumentPickerParams(
              allowedFileExtensions: ['mwfbak'],
              allowedUtiTypes: ['com.sidlatau.example.mwfbak'],
              allowedMimeTypes: ['application/*'],
              invalidFileNameSymbols: ['/'],
              );

                  }else {
                    print("attach");
                    // final filepvier = FilePicker. platform();
                    // List<File> files = await FilePicker.getMultiFile();

                    // if (files != null) {
                    //   print("Success picking file ");
                    // } else
                    //   print("FAIlure picking file ");

                    setState(() {
//
                    });
                  }
                }
                if (index == 3) {
                  print("timeline");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Absence_Timeline(widget.mobid),
                      ));
                }

                widget.parent.setState(() {
                  isloading = false;
                });
              }
            },
          ),
        ],
      );
    }

    Widget popularFilter() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Column(
              children: getPList(),
            ),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      );
    }

    ADD_TO_LIST() {}

    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Stack(
        children: <Widget>[
          FutureBuilder(
              future: initialise_Vaiables(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return ListView(
                  children: [

                    Drop_Down_Master(dropDowns, widget.th, this),

                    div(),

                    if (valis_2_or_3()) gettextbox("Houly"),

                    if (valis_2_or_3())
                      formclock(
                          "Date Range",
                          DateFormat('dd - MM - yyyy').format(startDate)
                          ,    DateFormat('dd - MM - yyyy').format(endDate),
                          0),
                    //TODO fix the controller does not change the values
                    if (ishourly && valis_2_or_3())
                      formclock(
                          "Time Range",
                          DateFormat('h:mm a').format(startDate)
                             ,
                              DateFormat('h:mm a').format(endDate),
                          1),
                    if (valis_2_or_3())
                      rejFormclock("Rejoining Date", rejoiningDatevar, 0),

                    formclockFourfield(
                        "Days", "%", "Hrs", "Min", ["0", "15", "30", "45"], 5),

                    div(),

                    if (valis_2_or_3()) popularFilter(),

                    if (valis_2_or_3())
                      if (popularFilterListData[3].isSelected)
                        textboxrow("Cash          ", 1, TextInputType.number),

                    if (valis_2_or_3()) div(),

                    textboxrow("Remarks 1", 2, TextInputType.text),

                    textboxrow("Remarks 2", 3, TextInputType.text),

                    Container(
                      height: 45,
                    )


                  ],


                  );



                return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ModalProgressHUD(
                      inAsyncCall: true,
                      child: Container(),
                    ));
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 10,
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.bottomCenter, child: bottomBar()),
              ),
            ],
          )
        ],
      ),
    );
  }

  Duration getdurationForTime(String str) {
    int h = int.parse(str.substring(0, 2));
    int m = int.parse(str.substring(3, 5));
    int s = int.parse(str.substring(6, 8));

    return Duration(hours: h, minutes: m, seconds: s);
  }

  Widget formclockFourfield(str, str2, str3, str4, list, index) {
    TextEditingController daysctrl = TextEditingController(
        text: (startDate.difference(endDate).inDays.abs() + 1).toString());
    TextEditingController percent = TextEditingController(
        text: (startDate.difference(endDate).inDays.abs() + 1).toString());
    TextEditingController minutes = TextEditingController(
        text: ((startDate.difference(endDate).inMinutes.abs() % 60) + 1)
            .toString());

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 6),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        onTap: () {
          widget.parent.setState(() {
//          checkAppPosition(i);
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  str,
                  style: TextStyle(color: widget.th.pr),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: daysctrl,
                  style: TextStyle(color: HexColor(blueTextcol)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14.5),
                  child: Text(
                    str2,
                    style: TextStyle(
                        color: widget.th.pr, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: percent,
                  style: TextStyle(
                    color:  HexColor(blueTextcol),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14.5),
                  child: Text(
                    str3,
                    style: TextStyle(
                        color: widget.th.pr, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: minutes,
                  style: TextStyle(color:  HexColor(blueTextcol)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14.5),
                  child: Text(
                    str4,
                    style: TextStyle(
                        color: widget.th.pr, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => SizedBox(
                            width: 50,
                            height: 50,
                            child: Seacrable_Listview(widget.th, "Search", this,
                                this, dropDowns.dropDown_5)));
//                    Navigator.push(context,MaterialPageRoute(builder: (context) => Seacrable_Listview(title: "Seach",),));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          dropDowns.dropDown_5.DropDownValue,
                          style: TextStyle(
                            color:  HexColor(blueTextcol),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color:  HexColor(blueTextcol),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  isNotselected() {
    if (dropDowns.dropDown_1.DropDownValue.compareTo("Select Employee") == 0 ||
        dropDowns.dropDown_2.DropDownValue.compareTo("Select Absence Type") ==
            0 ||
        dropDowns.dropDown_3.DropDownValue.compareTo("Select Absence Code") ==
            0 ||
        dropDowns.dropDown_4.DropDownValue.compareTo("Select Entry Type") == 0)
      return true;

    return false;
  }

  saveTolocal(dbvar, mobid, perDiem, operation) async {
    //if saveed from saved form
    if (widget.screentype == Screen_type.Saved_Request) {
      updating_allDB DB = updating_allDB();
      await DB.update_Absence_Transaction(
          cmpidd: 0,
          Company: "",
          rejoiningDate: DateFormat('yyyy-MM-dd').format(endDate),
          remarks1: txt1.text,
          remarks2: txt2.text,
          fromDate: DateFormat('yyyy-MM-dd').format(startDate),
          fromTime: DateFormat('HH:mm:ss').format(startDate),
          holidays: 0,
          hourly: 1, //todo
          TRX_ID: 0,
          perDiem: perDiem,
          leavedays: 0,
          airTicket: 1, //todo
          calendarDays: 0,
          NumberOfDays: 0,
          Status: 0,
          entryDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          toDate: DateFormat('yyyy-MM-dd').format(endDate),
          toTime: DateFormat('HH:mm:ss').format(endDate),
          cashCheck: 1, //todo
          WorkflowMasterID: 0,
          recordIDD: 0,
          RequestDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          SubmittedByUserID: 0,
          transactionNumber: 0,
          leaveSalary: 1, //todo
          EmployeeUserID: 0,
          weekendDays: 0,
          //TODO problem here

          mobid: mobid,

          //TODO day%  = to hours-from hours ) / No . of hours in day whish is from calender shift
          // TODO table and calender id and shift id is from employee master
          dayPercentage: 0,
          offHours: startDate
              .difference(endDate)
              .abs()
              .inHours, //TODO cal culate hours
          OffMints:
              startDate.difference(endDate).abs().inMinutes, //TODO cal minutas

// todo drop1

          employeeIDD: int.parse(dropDowns.dropDown_1.recidemploymaster),
          employeeCode: dropDowns.dropDown_1.DropDownValue,
          calendarIDD: dropDowns.dropDown_1.calendarIDD,
          calendarCode: dropDowns.dropDown_1.calendarCode,

//drop 2
          leaveTypeCode: dropDowns.dropDown_2.DropDownValue,
//                  leaveTypeIDD:absencetypeval,
          leaveTypeIDD: int.parse(dropDowns.dropDown_2.DropDownCode),
//drop 3
          LeaveCode: dropDowns.dropDown_3.DropDownValue,
          LeaveCodeIDD: dropDowns.dropDown_3.DropDownCode,
//drop 4
          entryType: dropDowns.dropDown_4.DropDownCode,

//todo make a text box if advance cash  is true

          cashAmount: cash.text,
          //TODO ADDED ON July 2020

          operation: operation,
          syncdate: DateTime.now().millisecondsSinceEpoch,
          syncstatus: 0,
          oldmobileid: widget.mobid);
    } else
      await dbvar.insert_Absence_Transaction(
          cmpidd: 0,
          Company: "",
          rejoiningDate: DateFormat('yyyy-MM-dd').format(endDate),
          remarks1: txt1.text,
          remarks2: txt2.text,
          fromDate: DateFormat('yyyy-MM-dd').format(startDate),
          fromTime: DateFormat('HH:mm:ss').format(startDate),
          holidays: 0,
          hourly: 1, //todo
          TRX_ID: 0,
          perDiem: perDiem,
          leavedays: 0,
          airTicket: 1, //todo
          calendarDays: 0,
          NumberOfDays: 0,
          Status: 0,
          entryDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          toDate: DateFormat('yyyy-MM-dd').format(endDate),
          toTime: DateFormat('HH:mm:ss').format(endDate),
          cashCheck: 1, //todo
          WorkflowMasterID: 0,
          recordIDD: 0,
          RequestDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          SubmittedByUserID: 0,
          transactionNumber: 0,
          leaveSalary: 1, //todo
          EmployeeUserID: 0,
          weekendDays: 0,
          //TODO problem here

          mobid: mobid,

          //TODO day%  = to hours-from hours ) / No . of hours in day whish is from calender shift
          // TODO table and calender id and shift id is from employee master
          dayPercentage: 0,
          offHours: startDate
              .difference(endDate)
              .abs()
              .inHours, //TODO cal culate hours
          OffMints:
              startDate.difference(endDate).abs().inMinutes, //TODO cal minutas

// todo drop1

          employeeIDD: int.parse(dropDowns.dropDown_1.empid),
          employeeCode: dropDowns.dropDown_1.DropDownCode,
          calendarIDD: dropDowns.dropDown_1.calendarIDD,
          calendarCode: dropDowns.dropDown_1.calendarCode,

//drop 2
          leaveTypeCode: dropDowns.dropDown_2.DropDownValue,
//                  leaveTypeIDD:absencetypeval,
          leaveTypeIDD:
              int.parse(dropDowns.dropDown_2.emprecidlvtidd2Forfilter4),
//drop 3
          LeaveCode: dropDowns.dropDown_3.DropDownValue,
          LeaveCodeIDD: dropDowns.dropDown_3.DropDownCode,
//drop 4
          entryType: dropDowns.dropDown_4.DropDownCode,

//todo make a text box if advance cash  is true

          cashAmount: cash.text,
          //TODO ADDED ON July 2020

          operation: operation,
          syncdate: DateTime.now().millisecondsSinceEpoch,
          syncstatus: 0);
  }

  Future<http.Response> SendAbsenceRequesttoServer(
      String title, String mobid) async {
    print(mobid);
    List list = await absence_Transaction.queryonlyRows(
        mobid, Absence_Transaction.mobid);

    Map mp = list.last;

    var t = jsonEncode(mp);
    final json = JSON.jsonDecode(t);
    Map ls = Map<String, dynamic>.from(json);

    ls.forEach((key, value) {
      print(key.toString() + ' -  ' + value.toString());
    });

    String username = id;
    String password = pas;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    Map narrow_map = {
      Absence_Transaction.entryType: mp[Absence_Transaction.entryType],
      Absence_Transaction.employeeIDD: mp[Absence_Transaction.employeeIDD],
      Absence_Transaction.leaveTypeIDD: mp[Absence_Transaction.leaveTypeIDD],
      Absence_Transaction.LeaveCodeIDD: mp[Absence_Transaction.LeaveCodeIDD],
      Absence_Transaction.fromDate: mp[Absence_Transaction.fromDate],
      Absence_Transaction.toDate: mp[Absence_Transaction.toDate],
      Absence_Transaction.rejoiningDate: mp[Absence_Transaction.rejoiningDate],
      Absence_Transaction.calendarDays: mp[Absence_Transaction.calendarDays],
      Absence_Transaction.weekendDays: mp[Absence_Transaction.weekendDays],
      Absence_Transaction.holidays: mp[Absence_Transaction.holidays],
      Absence_Transaction.leavedays: mp[Absence_Transaction.leavedays],
      Absence_Transaction.remarks1: mp[Absence_Transaction.remarks1],
      Absence_Transaction.remarks2: mp[Absence_Transaction.remarks2],
      Absence_Transaction.airTicket: mp[Absence_Transaction.airTicket],
      "NumberOfDays": "0",
      Absence_Transaction.perDiem: mp[Absence_Transaction.perDiem],
      Absence_Transaction.leaveSalary: mp[Absence_Transaction.leaveSalary],
      Absence_Transaction.cashCheck: mp[Absence_Transaction.cashCheck],
      Absence_Transaction.hourly: mp[Absence_Transaction.hourly],
      Absence_Transaction.fromTime: mp[Absence_Transaction.fromTime],
      Absence_Transaction.toTime: mp[Absence_Transaction.toTime],
      Absence_Transaction.offHours: mp[Absence_Transaction.offHours],
      "OffMints": "0",
      Absence_Transaction.dayPercentage: mp[Absence_Transaction.dayPercentage],
      "TransRemarks": "",
      Absence_Transaction.mobid: mp[Absence_Transaction.mobid],
    };

    print(narrow_map);
    print(uid);

    return http.post(
      'http://smemobapi.azurewebsites.net/api/AbsenceTransaction/Insertabsencetransaction?UserId=$uid',
      headers: <String, String>{
        'Host': "smemobapi.azurewebsites.net",
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(narrow_map
//        'da':'daad'

          ),
    );
  }

  InsertedAbsenceTransaction(mobid) async {
    Map ls = await getDataForMobidapiAsMap(
        id, pas, GetInsertedAbsenceTransaction, mobid);

    ls.forEach((key, value) {
//  print(key  + '   _  '   + value.toString());
    });
    return ls;
  }

  getDataForMobidapiAsMap(
      String Username, String Password, String link, String mobid) async {
//return await GetIp.ipAddress;

    link = link += "?mobid=${mobid}";
//print(link);

    String username = Username;
    String password = Password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
//  print(basicAuth);
    print(link);
    Response r =
        await get(link, headers: <String, String>{'authorization': basicAuth});
//  print(r.statusCode);
//
//  print(r.body);
    var json;
    try {
      json = JSON.jsonDecode(r.body);
    } catch (e) {
      setState(() {
        isloading = false;
      });

      return await Alert(
              context: context,
              title: "ERROR",
              desc: 'AP100-Connectivity Issue Please Contact Support.')
          .show();
    }

    List ls = List.from(json);

    return ls.first;
  }

  getDataForMobidapiAsList(
      String Username, String Password, String link, String mobid) async {
//return await GetIp.ipAddress;

    link = link += "?mobid=${mobid}";
//print(link);

    String username = Username;
    String password = Password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
//  print(basicAuth);
    print(link);
    Response r =
        await get(link, headers: <String, String>{'authorization': basicAuth});
//  print(r.statusCode);
//
//  print(r.body);
    var json;
    try {
      json = JSON.jsonDecode(r.body);
    } catch (e) {
      setState(() {
        isloading = false;
      });

      return await Alert(
              context: context,
              title: "ERROR",
              desc: 'AP100-Connectivity Issue Please Contact Support.')
          .show();
    }

    List ls = List.from(json);

    return ls;
  }

  InsertAbsenceTransactionStatus(mobid) async {
    return await getDataForMobidapiAsList(
        id, pas, GetInsertedAbsenceTransactionStatus, mobid);
  }

  Approve_pending_request() async {
    final Eb_prllevtrx_status eb_prllevtrx_status =
        Eb_prllevtrx_status.instance;
    List o = await eb_prllevtrx_status.queryAllRows();

    o.forEach((element) {
      print("eb_prllevtrx_status");
      print(element);
    });

    //   List statusMaxSeq =await eb_prllevtrx_status.queryonlyRows( lsmax.first['MAX(seq)'] ,Eb_prllevtrx_status.seq,Eb_prllevtrx_status.Processed,"0",Eb_prllevtrx_status.MainApproverUserID,uid);

    List selectRecordID = await eb_prllevtrx_status.queryonlyRows2var(
        Eb_prllevtrx_status.LeaveTransactionID,
        snapshot[Absence_Transaction
            .recordIDD] /*,Eb_prllevtrx_status.LeaveTransactionID, snapshot[Absence_Transaction.TRX_ID],Eb_prllevtrx_status.tag, '1', Eb_prllevtrx_status.Processed, "0", Eb_prllevtrx_status.RequestStatusID, '3',Eb_prllevtrx_status.MainApproverUserID, uid*/);

    List<Map> AbsList_SUB = [];
    List AllStatusrec = [];

    int MaxSeq = -9223372036854775806;

    selectRecordID.forEach((element) {
      print(element[Eb_prllevtrx_status.seq]);
      if (MaxSeq < element[Eb_prllevtrx_status.seq]) {
        MaxSeq = element[Eb_prllevtrx_status.seq];
      }
    });

    //    final eb_prllevtrx_status = Eb_prllevtrx_status.instance;

    List ls = await eb_prllevtrx_status.queryonlyRowsWith5_var(
        Eb_prllevtrx_status.LeaveTransactionID,
        snapshot[Absence_Transaction.recordIDD],
        Eb_prllevtrx_status.seq,
        MaxSeq,
        Eb_prllevtrx_status.tag,
        '1',
        Eb_prllevtrx_status.Processed,
        0,
        Eb_prllevtrx_status.RequestStatusID,
        '3',
        Eb_prllevtrx_status.MainApproverUserID,
        uid);
    if (ls.length == 0) {
      print("length is ZERO ");
      return await Alert(
          context: context, title: "ERROR", desc: 'NO RECORD FOUND');
    }

    Map mpData = ls.first;
    String username = id;
    String password = pas;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    String Approve_req =
        'http://smemobapi.azurewebsites.net/api/AbsenceTransaction/ApproveAbsence';
    Map ApproveMap = {
      "mobid": mpData[Eb_prllevtrx_status.mobid],
      "LeaveTransactionID": mpData[Eb_prllevtrx_status.LeaveTransactionID],
      "ID": mpData[Eb_prllevtrx_status.ID],
      "ApprovedByUserID": int.parse(uid)
    };

    print(Approve_req);
    print(ApproveMap);
    print(jsonEncode(ApproveMap));

    Response res = await http.post(
      Approve_req,
      headers: <String, String>{
        'Host': "smemobapi.azurewebsites.net",
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(ApproveMap),
    );
    print(res.body);

    insering_allDB dbvar = insering_allDB();

    String GetApprovedRecord =
        "http://smemobapi.azurewebsites.net/api/AbsenceTransaction/GetInsertedAbsenceTransactionStatus?mobid=${mpData[Eb_prllevtrx_status.mobid]}";

    print(GetApprovedRecord);
    Response r = await get(GetApprovedRecord,
        headers: <String, String>{'authorization': basicAuth});

    final json = JSON.jsonDecode(r.body);

    print(json);
    List GetApprovedRecordls = List.from(json);

    GetApprovedRecordls.forEach((element) {
      print("STATUS TABLE :");
      print(element);

      dbvar.insert_Eb_prllevtrx_status(
          syncstatus: 1,
          operation: 'Downloaded',
          syncdate: DateTime.now().millisecondsSinceEpoch,
          WorkflowMasterID: element['WorkflowMasterID'],
          mobid: element['mobid'],
          Company: element['Company'],
          cmpidd: element['cmpidd'],
          ApprovedByUserID: element['ApprovedByUserID'],
          approvingline: element['groupcoode'],
          groupcode: element['WorkflowMasterID'],
          groupidd: element['groupidd'],
          ID: element['ID'],
          LeaveTransactionID: element['LeaveTransactionID'],
          levelcolor: element['levelcolor'],
          levelversion: element['levelversion'],
          MainApproverUserID: element['MainApproverUserID'],
          MappingType: element['MappingType'],
          Processed: element['Processed'],
          ProcessedDate: element['ProcessedDate'],
          Remarks: element['Remarks'],
          RequestStatusID: element['RequestStatusID'],
          seq: element['seq'],
          tag: element['tag'],
          Transremarks: element['Transremarks'],
          UpdateDate: element['UpdateDate'],
          UserLevel: element['UserLevel'],
          VoidedOnRecall: element['VoidedOnRecall'],
          WorkflowID: element['WorkflowID'],
          ApprovedByUserIDName:
              element[Eb_prllevtrx_status.ApprovedByUserIDName],
          MainApproverUserIDName:
              element[Eb_prllevtrx_status.MainApproverUserIDName]);
    });
  }

  Reject_pending_request() async {
    final Eb_prllevtrx_status eb_prllevtrx_status =
        Eb_prllevtrx_status.instance;
    List o = await eb_prllevtrx_status.queryAllRows();

    o.forEach((element) {
      print("eb_prllevtrx_status");
      print(element);
    });

    //   List statusMaxSeq =await eb_prllevtrx_status.queryonlyRows( lsmax.first['MAX(seq)'] ,Eb_prllevtrx_status.seq,Eb_prllevtrx_status.Processed,"0",Eb_prllevtrx_status.MainApproverUserID,uid);

    List selectRecordID = await eb_prllevtrx_status.queryonlyRows2var(
        Eb_prllevtrx_status.LeaveTransactionID,
        snapshot[Absence_Transaction
            .recordIDD] /*,Eb_prllevtrx_status.LeaveTransactionID, snapshot[Absence_Transaction.TRX_ID],Eb_prllevtrx_status.tag, '1', Eb_prllevtrx_status.Processed, "0", Eb_prllevtrx_status.RequestStatusID, '3',Eb_prllevtrx_status.MainApproverUserID, uid*/);

    List<Map> AbsList_SUB = [];
    List AllStatusrec = [];

    int MaxSeq = -9223372036854775806;

    selectRecordID.forEach((element) {
      print(element[Eb_prllevtrx_status.seq]);
      if (MaxSeq < element[Eb_prllevtrx_status.seq]) {
        MaxSeq = element[Eb_prllevtrx_status.seq];
      }
    });

    //    final eb_prllevtrx_status = Eb_prllevtrx_status.instance;

    List ls = await eb_prllevtrx_status.queryonlyRowsWith5_var(
        Eb_prllevtrx_status.LeaveTransactionID,
        snapshot[Absence_Transaction.recordIDD],
        Eb_prllevtrx_status.seq,
        MaxSeq,
        Eb_prllevtrx_status.tag,
        '1',
        Eb_prllevtrx_status.Processed,
        0,
        Eb_prllevtrx_status.RequestStatusID,
        '3',
        Eb_prllevtrx_status.MainApproverUserID,
        uid);
    if (ls.length == 0) {
      print("length is ZERO ");
      return await Alert(
          context: context, title: "ERROR", desc: 'NO RECORD FOUND');
    }

    Map mpData = ls.first;
    String username = id;
    String password = pas;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    String Approve_req =
        'http://smemobapi.azurewebsites.net/api/AbsenceTransaction/RejectAbsence';
    Map ApproveMap = {
      "mobid": mpData[Eb_prllevtrx_status.mobid],
      "LeaveTransactionID": mpData[Eb_prllevtrx_status.LeaveTransactionID],
      /*"ID"*/ "LeaveTransactionStatusID": mpData[Eb_prllevtrx_status.ID],
      "ApprovedByUserID": int.parse(uid)
    };

    print(Approve_req);
    print(ApproveMap);
    print(jsonEncode(ApproveMap));

    Response res = await http.post(
      Approve_req,
      headers: <String, String>{
        'Host': "smemobapi.azurewebsites.net",
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(ApproveMap),
    );
    print(res.body);

    insering_allDB dbvar = insering_allDB();

    String GetApprovedRecord =
        "http://smemobapi.azurewebsites.net/api/AbsenceTransaction/GetInsertedAbsenceTransactionStatus?mobid=${mpData[Eb_prllevtrx_status.mobid]}";

    print(GetApprovedRecord);
    Response r = await get(GetApprovedRecord,
        headers: <String, String>{'authorization': basicAuth});

    final json = JSON.jsonDecode(r.body);

    print(json);
    List GetApprovedRecordls = List.from(json);

    GetApprovedRecordls.forEach((element) {
      print("STATUS TABLE :");
      print(element);

      dbvar.insert_Eb_prllevtrx_status(
          syncstatus: 1,
          operation: 'Downloaded',
          syncdate: DateTime.now().millisecondsSinceEpoch,
          WorkflowMasterID: element['WorkflowMasterID'],
          mobid: element['mobid'],
          Company: element['Company'],
          cmpidd: element['cmpidd'],
          ApprovedByUserID: element['ApprovedByUserID'],
          approvingline: element['groupcoode'],
          groupcode: element['WorkflowMasterID'],
          groupidd: element['groupidd'],
          ID: element['ID'],
          LeaveTransactionID: element['LeaveTransactionID'],
          levelcolor: element['levelcolor'],
          levelversion: element['levelversion'],
          MainApproverUserID: element['MainApproverUserID'],
          MappingType: element['MappingType'],
          Processed: element['Processed'],
          ProcessedDate: element['ProcessedDate'],
          Remarks: element['Remarks'],
          RequestStatusID: element['RequestStatusID'],
          seq: element['seq'],
          tag: element['tag'],
          Transremarks: element['Transremarks'],
          UpdateDate: element['UpdateDate'],
          UserLevel: element['UserLevel'],
          VoidedOnRecall: element['VoidedOnRecall'],
          WorkflowID: element['WorkflowID'],
          ApprovedByUserIDName:
              element[Eb_prllevtrx_status.ApprovedByUserIDName],
          MainApproverUserIDName:
              element[Eb_prllevtrx_status.MainApproverUserIDName]);
    });
    return 1;
  }

  Revise_pending_request() async {


    String revisetostatusid = 'SELECT';
    bool isLodaing_Revise = false;
    var ls;
    String ID_revise = '';

    get_Revise_Dropdown() async {
      final Eb_prllevtrx_status eb_prllevtrx_status =
          Eb_prllevtrx_status.instance;
      List y = await eb_prllevtrx_status.queryonlyRows2var(
          Eb_prllevtrx_status.LeaveTransactionID,
          snapshot[Absence_Transaction.recordIDD]);
      List strrevise = [];
      y.forEach((element) {
        if(element[Eb_prllevtrx_status.RequestStatusID] ==  1 ||element[Eb_prllevtrx_status.RequestStatusID] ==  5) {
          print("STATUS TABLE ");

          strrevise.add(
              element[Eb_prllevtrx_status.ID].toString() +
                  '| ' +
                  element[Eb_prllevtrx_status.seq].toString() +
                  ' ' +
                  element[Eb_prllevtrx_status
                      .MainApproverUserID]
                      .toString() +
                  ' '

            // element[Eb_prllevtrx_status.MainApproverUserIDName].toString() + " "+    element[Eb_prllevtrx_status.MainApproverUserIDName].toString()

          );
          revisetostatusid =  element[Eb_prllevtrx_status.ID].toString() +
              '| ' +
              element[Eb_prllevtrx_status.seq].toString() +
              ' ' +
              element[Eb_prllevtrx_status
                  .MainApproverUserID]
                  .toString() +
              ' ';

          /*revisetostatusid*/ID_revise =     element[Eb_prllevtrx_status.ID].toString();
          print(element);
        }

      });

      strrevise.add("SELECT");

      ls = strrevise.map((value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList();
      return 1;
    }

    return showMobilePopup(
      context: context,
      builder: (context) => FutureBuilder(
          future: get_Revise_Dropdown(),
          builder: (context, snapshot1) {
            if (snapshot1.hasData) {
              return MobilePopUp(
                  actions: [],
                  title: 'App Settings',
                  leadingColor: Colors.white,
                  child: SingleChildScrollView(
                    child: ModalProgressHUD(
                      inAsyncCall: isLodaing_Revise,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context)
                                .size
                                .width *
                                0.8,
                            child: DropdownButton<String>(
                              value: revisetostatusid,
                              items: ls,
                              onChanged: (_) {
                                print("____________________");
                                print(_);
                                widget.parent.  setState(() {

                                  revisetostatusid = _;
                                  ID_revise = _.substring(0, 4);
                                });

                                print(ID_revise);
                              },
                            ),
                          ),
                          textboxrow(
                              "Message", 4, TextInputType.text),
                          FlatButton(
                            color: Colors.blueAccent,
                            child: Text(
                              "Revise",
                              style: TextStyle(
                                  color: Colors.white),
                            ),
                            onPressed: () async {
                              setState(() {
                                isLodaing_Revise = true;
                              });
                              if (revisetostatusid
                                  .compareTo("") ==
                                  0 ||
                                  msgtxtxtrl.text
                                      .compareTo("") ==
                                      0) {
                                print("Something went wrong ");
                              } else {
                                final Eb_prllevtrx_status
                                eb_prllevtrx_status =
                                    Eb_prllevtrx_status
                                        .instance;
                                List y =
                                await eb_prllevtrx_status
                                    .queryAllRows();

                                y.forEach((element) {
                                  print("STATUS TABLE ");

                                  print(element);
                                });

                                List selectRecordID =
                                await eb_prllevtrx_status
                                    .queryonlyRows2var(
                                    Eb_prllevtrx_status
                                        .LeaveTransactionID,
                                    snapshot[
                                    Absence_Transaction
                                        .recordIDD] /*,Eb_prllevtrx_status.LeaveTransactionID, snapshot[Absence_Transaction.TRX_ID],Eb_prllevtrx_status.tag, '1', Eb_prllevtrx_status.Processed, "0", Eb_prllevtrx_status.RequestStatusID, '3',Eb_prllevtrx_status.MainApproverUserID, uid*/);

                                List<Map> AbsList_SUB = [];
                                List AllStatusrec = [];

                                int MaxSeq =
                                -9223372036854775806;

                                selectRecordID
                                    .forEach((element) {
                                  print(element[
                                  Eb_prllevtrx_status.seq]);
                                  if (MaxSeq <
                                      element[
                                      Eb_prllevtrx_status
                                          .seq]) {
                                    MaxSeq = element[
                                    Eb_prllevtrx_status
                                        .seq];
                                  }
                                });

                                //    final eb_prllevtrx_status = Eb_prllevtrx_status.instance;

                                List ls = await eb_prllevtrx_status
                                    .queryonlyRowsWith5_var(
                                    Eb_prllevtrx_status
                                        .LeaveTransactionID,
                                    snapshot[
                                    Absence_Transaction
                                        .recordIDD],
                                    Eb_prllevtrx_status.seq,
                                    MaxSeq,
                                    Eb_prllevtrx_status.tag,
                                    '1',
                                    Eb_prllevtrx_status
                                        .Processed,
                                    0,
                                    Eb_prllevtrx_status
                                        .RequestStatusID,
                                    '3',
                                    Eb_prllevtrx_status
                                        .MainApproverUserID,
                                    uid);

                                if (ls.length == 0) {
                                  print("length is ZERO ");
                                  return await Alert(
                                      context: context,
                                      title: "ERROR",
                                      desc: 'NO RECORD FOUND');
                                }

                                print("EVERYTING IS FINE s");

                                Map mpData = ls.first;

                                String username = id;
                                String password = pas;
                                String basicAuth = 'Basic ' +
                                    base64Encode(utf8.encode(
                                        '$username:$password'));

                                String Approve_req =
                                    'http://smemobapi.azurewebsites.net/api/AbsenceTransaction/ReviseAbsence';
                                Map ApproveMap = {
                                  "mobid": mpData[
                                  Eb_prllevtrx_status
                                      .mobid],
                                  "LeaveTransactionID":
                                  mpData[Eb_prllevtrx_status
                                      .LeaveTransactionID],
                                  /*"ID"*/
                                  "ID":
                                  mpData[Eb_prllevtrx_status
                                      .ID],
                                  "ApprovedByUserID":
                                  int.parse(uid),
                                  "ReviseToStatusId": int.parse(ID_revise)
                                };

                                print(Approve_req);
                                print(ApproveMap);
                                print(jsonEncode(ApproveMap));

                                Response res = await http.post(
                                  Approve_req,
                                  headers: <String, String>{
                                    'Host':
                                    "smemobapi.azurewebsites.net",
                                    'Authorization': basicAuth,
                                    'Content-Type':
                                    'application/json',
                                  },
                                  body: jsonEncode(ApproveMap),
                                );
                                print(res.body);


                                insering_allDB dbvar = insering_allDB();

                                String GetApprovedRecord =
                                    "http://smemobapi.azurewebsites.net/api/AbsenceTransaction/GetInsertedAbsenceTransactionStatus?mobid=${mpData[Eb_prllevtrx_status.mobid]}";

                                print(GetApprovedRecord);
                                Response r = await get(GetApprovedRecord,
                                    headers: <String, String>{'authorization': basicAuth});

                                final json = JSON.jsonDecode(r.body);

                                print(json);
                                List GetApprovedRecordls = List.from(json);

                                GetApprovedRecordls.forEach((element) {
                                  print("STATUS TABLE :");
                                  print(element);

                                  dbvar.insert_Eb_prllevtrx_status(
                                      syncstatus: 1,
                                      operation: 'Downloaded',
                                      syncdate: DateTime.now().millisecondsSinceEpoch,
                                      WorkflowMasterID: element['WorkflowMasterID'],
                                      mobid: element['mobid'],
                                      Company: element['Company'],
                                      cmpidd: element['cmpidd'],
                                      ApprovedByUserID: element['ApprovedByUserID'],
                                      approvingline: element['groupcoode'],
                                      groupcode: element['WorkflowMasterID'],
                                      groupidd: element['groupidd'],
                                      ID: element['ID'],
                                      LeaveTransactionID: element['LeaveTransactionID'],
                                      levelcolor: element['levelcolor'],
                                      levelversion: element['levelversion'],
                                      MainApproverUserID: element['MainApproverUserID'],
                                      MappingType: element['MappingType'],
                                      Processed: element['Processed'],
                                      ProcessedDate: element['ProcessedDate'],
                                      Remarks: element['Remarks'],
                                      RequestStatusID: element['RequestStatusID'],
                                      seq: element['seq'],
                                      tag: element['tag'],
                                      Transremarks: element['Transremarks'],
                                      UpdateDate: element['UpdateDate'],
                                      UserLevel: element['UserLevel'],
                                      VoidedOnRecall: element['VoidedOnRecall'],
                                      WorkflowID: element['WorkflowID'],
                                      ApprovedByUserIDName:
                                      element[Eb_prllevtrx_status.ApprovedByUserIDName],
                                      MainApproverUserIDName:
                                      element[Eb_prllevtrx_status.MainApproverUserIDName]);
                                });
                                return 1;

                              }
                              setState(() {
                                isLodaing_Revise = true;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ));
            }

            return ModalProgressHUD(
              inAsyncCall: true,
              child: Container(),
            );
          }),
    );




  }
  Widget textboxrow(str, num, input) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 3),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        onTap: () {
          widget.parent.setState(() {
//          checkAppPosition(i);
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  str,
                  style: TextStyle(color: widget.th.pr),
                ),
              ),
              Container(
                width: 40,
              ),
              Expanded(
                  child: Theme(
                    data: new ThemeData(
                      // primaryColor: Colors.redAccent,
                      // primaryColorDark: Colors.red,
                    ),
                    child: new TextField(
                      style: TextStyle(color: widget.th.pr),
                      keyboardType: input,
                      controller: num == 1
                          ? cash
                          : num == 2 ? txt1 : num == 3 ? txt2 : msgtxtxtrl,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: widget.th.pr)),
                          hintText: '',
                          helperText: '',
                          labelText: '',
//                        prefixIcon: const Icon(
//                          Icons.person,
//                          color: Colors.green,
//                        ),
                          prefixText: ' ',
                          suffixText: '',
                          suffixStyle: const TextStyle(color: Colors.green)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

}
