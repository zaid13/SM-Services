import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sm_service/AppScreens/Searchable_List/seacrhableListview.dart';
import 'package:sm_service/AppScreens/TimeLine/TimeLineScreen.dart';
import 'package:sm_service/App_Initialization/App_classes/BottomBar.dart';
import 'package:sm_service/App_Initialization/App_classes/DropDowns.dart';
import 'package:sm_service/App_Initialization/App_classes/PopularFilterListData.dart';
import 'package:sm_service/App_Initialization/App_classes/Tab_Icons.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/DataStructures/DropDown_Master.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_1.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_2.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_3.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_4.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_5.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/Database_Files/Updating_All_DB.dart';

class Absence_Body extends StatefulWidget {
  Absence_Body(this.th, this.screentype, this.parent,this.mobid);
  theme th;
  Screen_type screentype;
  var parent;
  String  mobid;

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
  List<TabIconData> tabIconsList;

  var txt1 = TextEditingController();
  var txt2 = TextEditingController();
  var cash = TextEditingController(text: "0");
  bool ishourly = false;
  int l = 0;
  List<PopularFilterListData> popularFilterListData =
      PopularFilterListData.popularFList;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  bool isloading =false;
  assignBottomIcon() {
    tabIconsList = TabIconData.tabIconsList;
    popularFilterListData.forEach((element) {
      element.isSelected = false;
    });
  }
  final absence_Transaction= Absence_Transaction.instance;
 String rejoiningDatevar='';

  @override
  void setState(fn) {
    // TODO: implement setState

    print(ishourly);
  }


  @override
  void initState() {
    dropDowns = DropDowns(dropDown_1, dropDown_2, dropDown_3, dropDown_4,dropDown_5);
    assignBottomIcon();
  }

  initialise_Vaiables() async {
    if (widget.screentype == Screen_type.Absence_Request) {
      await initialise_absence();
    }
    if (widget.screentype == Screen_type.Saved_Request) {
      await initialise_saved();
    }
    if (widget.screentype == Screen_type.Pending_Request) {
      await initialise_pending();
    }
    if (widget.screentype == Screen_type.Submitted_Request) {
      await initialise_submitted();
    }
    return 1;
  }

  initialise_absence() async {

    var recidemploymaster = await dropDowns.dropDown_1.setForDefault(uid);
    var emprecidlvtidd2Forfilter4 =
        await dropDowns.dropDown_2.setForDefault(recidemploymaster);
    await dropDowns.dropDown_3
        .setForDefault(recidemploymaster, emprecidlvtidd2Forfilter4);
    await dropDowns.dropDown_4.setForDefault();

  }

  initialise_saved() async {
    await setvarables_FROM_TRANSACTION_TABLE();
  }
  initialise_pending() async {
    await setvarables_FROM_TRANSACTION_TABLE();

  }
  initialise_submitted() async {
    await setvarables_FROM_TRANSACTION_TABLE();

  }

  valis_2_or_3() {
    return true;
  }

  setvarables_FROM_TRANSACTION_TABLE() async {

    List ls = await absence_Transaction.queryonlyRows( widget.mobid, Absence_Transaction.mobid);

    Map snapshot = ls.last;


    startDate = DateTime.parse(  snapshot['${Absence_Transaction.fromDate}'].toString());
    endDate = DateTime.parse(  snapshot['${Absence_Transaction.toDate}'].toString());
    txt1.text =  snapshot['${Absence_Transaction.remarks1}'].toString();
    txt2.text=  snapshot['${Absence_Transaction.remarks2}'].toString();
    cash.text = snapshot['${Absence_Transaction.cashAmount}'].toString();
//    startDate.add(Duration(hours:   ,minutes:  ,seconds: ));
print(snapshot['${Absence_Transaction.fromTime}'].toString() );



    if( snapshot['${Absence_Transaction.leaveSalary}']==1){
      popularFilterListData[3].isSelected = true;
    }else{
      popularFilterListData[3].isSelected = false;
    }

    if( snapshot['${Absence_Transaction.cashCheck}']==1){
      popularFilterListData[2].isSelected = true;
    }else{
      popularFilterListData[2].isSelected = false;
    }

    if( snapshot['${Absence_Transaction.perDiem}']==1){
      popularFilterListData[1].isSelected = true;
    }else{
      popularFilterListData[1].isSelected = false;
    }
    if( snapshot['${Absence_Transaction.airTicket}']==1){
      popularFilterListData[0].isSelected = true;
    }else{

      popularFilterListData[0].isSelected = false;
    }

    rejoiningDatevar = snapshot['${Absence_Transaction.rejoiningDate}'].toString();



  startDate.add(  getdurationForTime(snapshot['${Absence_Transaction.fromTime}'].toString() ));
    endDate.add(  getdurationForTime(snapshot['${Absence_Transaction.toTime}'].toString() ));

await dropDowns.dropDown_1.setValuesby_idd(  snapshot['${Absence_Transaction.employeeIDD}'].toString()) ;

    await dropDowns.dropDown_2.setValuesby_RecordID(  snapshot['${Absence_Transaction.leaveTypeIDD}'].toString()) ;

    await dropDowns.dropDown_3.setValuesby_LeaveCodeID(  snapshot['${Absence_Transaction.LeaveCodeIDD}'].toString()) ;

    await dropDowns.dropDown_4.setValues(  snapshot['${Absence_Transaction.entryType}'].toString()) ;


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

    Widget formclock(str, str2, int a) {
      if (a == 0)
        return Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 3),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
             widget.parent. setState(() {
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
                        widget.parent.   setState(() {
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
      else if (a == 1) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 3),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              widget.parent.  setState(() {
//          checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());

//                print("pressed");
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
                        widget.parent.   setState(() {
                          startDate = start;
                          endDate = end;
                        });

//                      print(start);
//                      print(end);
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
                        widget.parent. setState(() {
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
            widget.parent. setState(() {
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
                    primaryColor: Colors.redAccent,
                    primaryColorDark: Colors.red,
                  ),
                  child: new TextField(
                    style: TextStyle(color: widget.th.pr),
                    keyboardType: input,
                    controller: num == 1
                        ? cash
                        : num == 2
                            ? txt1
                            : num == 3 ? txt2 : TextEditingController(),
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


//            RESET_SCREEN();
            },
            changeIndex: (int index) async {
              if ((index == 0 || index == 1) && isNotselected()) {
                return await Alert(
                    context: context,
                    title: "ERROR",
                    desc: 'Select All the drop downs')
                    .show();
              }
else {
 widget.parent.  setState(() {
                isloading = true;
              });
                if (index == 0) {

                  String mobid = Random().nextInt(1000000).toString() + DateTime
                      .now()
                      .millisecondsSinceEpoch
                      .toString() + dropDowns.dropDown_1.recidemploymaster.toString();

                  if(startDate.isAfter(endDate)){
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
                if (index == 1) {
                  print("submit");
                  print("pressed");


                  String mobid = Random().nextInt(1000000).toString() + DateTime
                      .now()
                      .millisecondsSinceEpoch
                      .toString() + dropDowns.dropDown_1.recidemploymaster.toString();

                  insering_allDB dbvar = insering_allDB();
                  bool airTick = popularFilterListData[0].isSelected;
                  bool perDiem = popularFilterListData[1].isSelected;
                  bool absenceSal = popularFilterListData[2].isSelected;
                  bool AdvanceCash = popularFilterListData[3].isSelected;


                  print(popularFilterListData[0].isSelected);
                  print(popularFilterListData[1].isSelected);
                  print(popularFilterListData[2].isSelected);
                  print(popularFilterListData[3].isSelected);
                  print("Hours" + startDate
                      .difference(endDate)
                      .abs()
                      .inHours
                      .toString());
                  print("Min" + startDate
                      .difference(endDate)
                      .abs()
                      .inMinutes
                      .toString());

                  saveTolocal(dbvar, mobid, perDiem, "ReadyToSubmit");

//SAVED TO LOCAL


                  http.Response a = await SendAbsenceRequesttoServer("", mobid);
                  print(a.statusCode);

                  print(a.body);

                  if (a.body.contains('ERROR') == true) {
                    Alert(context: context, title: "ERROR", desc: a.body).show();
                  }
                  else {
//  InsertedAbsenceTransaction(mobid);
                    Alert(context: context, title: "Submitted", desc: a.body).show();
                    print('Inserted');
                    Eb_prllevtrx_status eb_prllevtrx_status = Eb_prllevtrx_status
                        .instance;

                    Map ls = await InsertedAbsenceTransaction(mobid);
                    Map d = {

                      "${Absence_Transaction.recordIDD}": ls['RecordIDD'],
                      "${Absence_Transaction.rejoiningDate}": ls['RejoiningDate'],
                      "${Absence_Transaction
                          .transactionNumber}": ls['TransactionNumber'],
                      "${Absence_Transaction.LeaveCode}": ls['Leavecode'],
                      "${Absence_Transaction.leaveTypeCode}": ls['RecordIDD'],
                      "${Absence_Transaction.calendarDays}": ls['CalendarDays'],
                      "${Absence_Transaction.weekendDays}": ls['WeekendDays'],
                      "${Absence_Transaction.holidays}": ls['Holidays'],
                      "${Absence_Transaction
                          .EmployeeUserID}": ls['Employeeuserid'],
                      "${Absence_Transaction
                          .WorkflowMasterID}": ls['WorkflowMasterID'],
                      "${Absence_Transaction
                          .SubmittedByUserID}": ls['Submittedbyuserid'],
                      "${Absence_Transaction.Status}": ls['Status'],
                      "${Absence_Transaction.NumberOfDays}": ls['NumberOfDays'],
                      "${Absence_Transaction
                          .WorkflowMasterID}": ls['WorkflowMasterID'],


                      "${Absence_Transaction.syncstatus}": 1,
                      "${Absence_Transaction.syncdate}": DateTime
                          .now()
                          .millisecondsSinceEpoch,
                      "${Absence_Transaction.operation}": 'Inserted',


                    };
                    int res = await absence_Transaction.update(
                        Map<String, dynamic>.from(d), mobid);
                    print("result*" + res.toString());
                    Map statusTable = await InsertAbsenceTransactionStatus(mobid);

                    dbvar.insert_Eb_prllevtrx_status(
                        syncstatus: 1,
                        operation: 'Inserted',
                        syncdate: DateTime
                            .now()
                            .millisecondsSinceEpoch,
                        WorkflowMasterID: statusTable['WorkflowMasterID'],
                        mobid: mobid,


                        Company: statusTable['Company'],
                        cmpidd: statusTable['cmpidd'],
                        ApprovedByUserID: statusTable['ApprovedByUserID'],
                        approvingline: statusTable['groupcoode'],
                        groupcode: statusTable['WorkflowMasterID'],
                        groupidd: statusTable['groupidd'],
                        ID: statusTable['ID'],
                        LeaveTransactionID: statusTable['levelversion'],
                        levelcolor: statusTable['levelcolor'],
                        levelversion: statusTable['levelversion'],
                        MainApproverUserID: statusTable['MainApproverUserID'],
                        MappingType: statusTable['MappingType'],
                        Processed: statusTable['Processed'],
                        ProcessedDate: statusTable['ProcessedDate'],
                        Remarks: statusTable['Remarks'],
                        RequestStatusID: statusTable['RequestStatusID'],
                        seq: statusTable['seq'],
                        tag: statusTable['tag'],
                        Transremarks: statusTable['Transremarks'],
                        UpdateDate: statusTable['UpdateDate'],
                        UserLevel: statusTable['UserLevel'],
                        VoidedOnRecall: statusTable['VoidedOnRecall'],
                        WorkflowID: statusTable['WorkflowID']


                    );

                    print('inserted');
                    //Sync =1
                    //o   Syncdate = current date
                    //o   Operation = “Updated”


                  }
                }
                if (index == 2) {
                  print("attach");
                  List<File> files = await FilePicker.getMultiFile();

                  if (files != null) {
                    print("Success picking file ");
                  } else
                    print("FAIlure picking file ");

                  setState(() {
//
                  });

                }
                if (index == 3) {
                  print("timeline");
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Absence_Timeline(),));
                }


 widget.parent.  setState(() {
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
          ListView(
            children: [
              FutureBuilder(
                  future: initialise_Vaiables(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return Drop_Down_Master(dropDowns, widget.th,this);


                    return Container(
                        height: MediaQuery.of(context).size.height,
                        child: ModalProgressHUD(
                          inAsyncCall: true,
                          child: Container(),
                        ));
                  }),

              div(),

              if (valis_2_or_3())
                gettextbox("Houly"),



              if (valis_2_or_3())
                formclock(
                    "Date Range",
                    DateFormat('dd - MM - yyyy').format(startDate) +
                        "   -   " +
                        DateFormat('dd - MM - yyyy').format(endDate),
                    0),
              //TODO fix the controller does not change the values
              if (ishourly && valis_2_or_3())
                formclock(
                    "Time Range",
                    DateFormat('h:mm a').format(startDate) +
                        "   -   " +
                        DateFormat('h:mm a').format(endDate),
                    1),
              if (valis_2_or_3())
                formclock("Rejoining Date", rejoiningDatevar, 0),

              formclockFourfield(
                  "Days", "%", "Hrs", "Min", ["0", "15", "30", "45"], 5),

              div(),

              if (valis_2_or_3())
                popularFilter(),

              if (valis_2_or_3())
                if (popularFilterListData[3].isSelected)
                  textboxrow("Cash          ", 1, TextInputType.number),

              if (valis_2_or_3())
                div(),

              textboxrow("Remarks 1", 2, TextInputType.text),

              textboxrow("Remarks 2", 3, TextInputType.text),

              Container(
                height: 45,
              )
            ],
          ),
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

  Duration getdurationForTime(String str ){

    int h =  int.parse(  str.substring(0,2) );
    int m = int.parse(str.substring(3,5));
    int s = int.parse(str.substring(6,8));

    return  Duration(hours: h ,minutes:m  ,seconds: s);



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
          widget.parent.   setState(() {
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
                  style: TextStyle(color: widget.th.pr),
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
                    color: widget.th.pr,
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
                  style: TextStyle(color: widget.th.pr),
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
                            child:
                                Seacrable_Listview(widget.th, "Search", this ,this ,  dropDowns.dropDown_5  )));
//                    Navigator.push(context,MaterialPageRoute(builder: (context) => Seacrable_Listview(title: "Seach",),));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          dropDowns.dropDown_5.DropDownValue,
                          style: TextStyle(
                            color: widget.th.pr,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: widget.th.pr,
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
        dropDowns.dropDown_2.DropDownValue.compareTo("Select Absence Type") == 0 ||
        dropDowns.dropDown_3.DropDownValue.compareTo("Select Absence Code") == 0 ||
        dropDowns.dropDown_4.DropDownValue.compareTo("Select Entry Type") == 0) return true;

    return false;
  }

  saveTolocal(dbvar, mobid,perDiem,operation)async{

    //if saveed from saved form
if(widget.screentype==Screen_type.Saved_Request){
  updating_allDB DB =updating_allDB();
  await DB.update_Absence_Transaction(
      cmpidd: 0,
      Company: "",
      rejoiningDate:  DateFormat('yyyy-MM-dd').format(endDate),
      remarks1:txt1.text,
      remarks2: txt2.text,
      fromDate: DateFormat('yyyy-MM-dd').format(startDate),
      fromTime: DateFormat('HH:mm:ss').format(startDate),
      holidays: 0,
      hourly: 1,//todo
      TRX_ID: 0,
      perDiem: perDiem ,
      leavedays: 0,
      airTicket: 1, //todo
      calendarDays:0,
      NumberOfDays: 0,
      Status: 0,
      entryDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      toDate: DateFormat('yyyy-MM-dd').format(endDate),
      toTime:DateFormat('HH:mm:ss').format(endDate),
      cashCheck: 1,//todo
      WorkflowMasterID: 0,
      recordIDD: 0,
      RequestDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      SubmittedByUserID: 0,
      transactionNumber: 0,

      leaveSalary:1 ,//todo
      EmployeeUserID: 0,
      weekendDays: 0,
      //TODO problem here

      mobid:mobid,


      //TODO day%  = to hours-from hours ) / No . of hours in day whish is from calender shift
      // TODO table and calender id and shift id is from employee master
      dayPercentage: 0 ,


      offHours: startDate.difference(endDate).abs().inHours ,  //TODO cal culate hours
      OffMints: startDate.difference(endDate).abs().inMinutes,   //TODO cal minutas





// todo drop1

      employeeIDD: int.parse(dropDowns.dropDown_1.recidemploymaster),
      employeeCode:  dropDowns.dropDown_1.DropDownValue,


      calendarIDD:dropDowns.dropDown_1.calendarIDD,
      calendarCode:dropDowns.dropDown_1.calendarCode,



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
    oldmobileid: widget.mobid





  );
}
else
    await dbvar.insert_Absence_Transaction(
        cmpidd: 0,
        Company: "",
        rejoiningDate:  DateFormat('yyyy-MM-dd').format(endDate),
        remarks1:txt1.text,
        remarks2: txt2.text,
        fromDate: DateFormat('yyyy-MM-dd').format(startDate),
        fromTime: DateFormat('HH:mm:ss').format(startDate),
        holidays: 0,
        hourly: 1,//todo
        TRX_ID: 0,
        perDiem: perDiem ,
        leavedays: 0,
        airTicket: 1, //todo
        calendarDays:0,
        NumberOfDays: 0,
        Status: 0,
        entryDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        toDate: DateFormat('yyyy-MM-dd').format(endDate),
        toTime:DateFormat('HH:mm:ss').format(endDate),
        cashCheck: 1,//todo
        WorkflowMasterID: 0,
        recordIDD: 0,
        RequestDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        SubmittedByUserID: 0,
        transactionNumber: 0,

        leaveSalary:1 ,//todo
        EmployeeUserID: 0,
        weekendDays: 0,
        //TODO problem here

        mobid:mobid,


        //TODO day%  = to hours-from hours ) / No . of hours in day whish is from calender shift
        // TODO table and calender id and shift id is from employee master
        dayPercentage: 0 ,


        offHours: startDate.difference(endDate).abs().inHours ,  //TODO cal culate hours
        OffMints: startDate.difference(endDate).abs().inMinutes,   //TODO cal minutas





// todo drop1

        employeeIDD: int.parse(dropDowns.dropDown_1.recidemploymaster),
        employeeCode:  dropDowns.dropDown_1.DropDownValue,


        calendarIDD:dropDowns.dropDown_1.calendarIDD,
        calendarCode:dropDowns.dropDown_1.calendarCode,



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
        syncstatus: 0





    );

  }

  Future<http.Response> SendAbsenceRequesttoServer(String title,String mobid) async {

    print(mobid);
    List list =  await absence_Transaction.queryonlyRows(mobid, Absence_Transaction.mobid);


    Map mp = list.last;


    var t  = jsonEncode(mp);
    final json=JSON.jsonDecode(t);
    Map ls = Map<String, dynamic>.from(json)  ;

    ls.forEach((key, value) {
//      print(key.toString() + ' -  '+value.toString());
    });

    String username = id;
    String password = pas ;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    return http.post(
      'http://smemobapi.azurewebsites.net/api/AbsenceTransaction/Insertabsencetransaction?UserId=4142&FormType=3130',
      headers: <String, String>{
        'Host':"smemobapi.azurewebsites.net",
        'Authorization': basicAuth,
        'Content-Type': 'application/json',

      },
      body: jsonEncode(mp
//        'da':'daad'

      ),
    );


  }
  InsertedAbsenceTransaction(mobid) async {


    Map ls = await getDataForMobidapiAsMap(id,pas,GetInsertedAbsenceTransaction ,mobid );

    ls.forEach((key, value) {
//  print(key  + '   _  '   + value.toString());
    });
    return ls;
  }

  getDataForMobidapiAsMap(String  Username ,String  Password  , String link ,String mobid) async {

//return await GetIp.ipAddress;

    link = link +="?mobid=${mobid}";
//print(link);

    String username = Username;
    String password = Password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
//  print(basicAuth);
    print(link);
    Response r = await get(link,
        headers: <String, String>{'authorization': basicAuth});
//  print(r.statusCode);
//
//  print(r.body);
    final json=JSON.jsonDecode(r.body);



    List ls = List.from(json)  ;

    return ls.first;

  }

  InsertAbsenceTransactionStatus(mobid) async {
    Map ls = await getDataForMobidapiAsMap(id,pas,GetInsertedAbsenceTransactionStatus ,mobid );
    ls.forEach((key, value) {
//    print(key  + '   _  '   + value.toString());
    });
    return ls;
  }


}
