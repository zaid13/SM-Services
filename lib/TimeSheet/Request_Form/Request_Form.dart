import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sm_service/AppScreens/Searchable_List/seacrhableListview.dart';
import 'package:sm_service/App_Initialization/App_classes/BottomBar.dart';
import 'package:sm_service/App_Initialization/App_classes/DropDowns.dart';
import 'package:sm_service/App_Initialization/App_classes/PopularFilterListData.dart';
import 'package:sm_service/App_Initialization/App_classes/Tab_Icons.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/AppScreens/Form_Screen/TopBar.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/TimeSheetParameter.dart';
import 'package:sm_service/TimeSheet/DropownClasses/ID_2.dart';
import 'package:sm_service/TimeSheet/DropownClasses/Emp_Code.dart';
import 'package:sm_service/TimeSheet/DropownClasses/Positon.dart';
import 'package:sm_service/TimeSheet/DropownClasses/ID_1.dart';
import 'package:sm_service/TimeSheet/DropownClasses/DD_3.dart';
import 'package:sm_service/TimeSheet/DropownClasses/DD_2.dart';
import 'package:sm_service/TimeSheet/DropownClasses/DD_1.dart';
import 'package:sm_service/TimeSheet/detail/detail.dart';
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

class RequestForm extends StatefulWidget {
  Screen_type screentype;
  theme th;
  var parent;
  String mobid;

  RequestForm(this.screentype, this.th, this.parent, this.mobid);

  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  theme th = theme();
  DropDown_TimeSheet dropDown_timeSheet = DropDown_TimeSheet();
  List<TabIconData> tabIconsList;
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  bool fresh = true;
  @override
  void initState() {
    th = widget.th;
    assignBottomIcon();
  }

  assignBottomIcon() {
    tabIconsList = TabIconData.tabIconsList;
    popularFilterListData.forEach((element) {
      element.isSelected = false;
    });
  }

  List<PopularFilterListData> popularFilterListData =
      PopularFilterListData.popularFList;

  var Comentr_Controler = TextEditingController();
  getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  getMapdata() {
    Map mp ={

      "TimeSheetMainForm": {
        "EmpId": 122,
        "EmpCod": "121",
        "PositionId": 4,
        "PositionCod": "Oct",
        "DependantDD1ID": dropDown_timeSheet.dependentDropDown_1.DropDownCode,
        "DependantDD2ID": dropDown_timeSheet.dependentDropDown_2.DropDownCode,
        "DependantDD3ID": dropDown_timeSheet.dependentDropDown_3.DropDownCode,
        "DependantDD4ID": dropDown_timeSheet.dependentDropDown_4.DropDownCode,
        "DependantDD1Code":  dropDown_timeSheet.dependentDropDown_1.DropDownValue,
        "DependantDD2Code": dropDown_timeSheet.dependentDropDown_2.DropDownValue,
        "DependantDD3Code": dropDown_timeSheet.dependentDropDown_3.DropDownValue,
        "DependantDD4Code": dropDown_timeSheet.dependentDropDown_4.DropDownValue,
        "IndependentDD1Id": dropDown_timeSheet.independentDropDown_1.DropDownCode,
        "IndependentDD1Code": dropDown_timeSheet.independentDropDown_1.DropDownValue,
        "IndependentDD2Id": dropDown_timeSheet.independentDropDown_2.DropDownCode,
        "IndependentDD2Code": dropDown_timeSheet.independentDropDown_2.DropDownCode,
        "Date":   date_controller1.text,
        "Attchment": "att",
        "mobid": DateTime.now().millisecondsSinceEpoch.toString()+getRandomString(10)
      },
      "EmpHourTypeList":
        [
          {
            "Hrclsidd": 130,
            "Hrclscod": "JMANOT",
            "Hours": "8.00",
            "Htdesc": "JMAN Overtime",
            "mobid": "32384321-1"
          },
          {
            "Hrclsidd": 130,
            "Hrclscod": "JMAN",
            "Hours": "4.3",
            "Htdesc": "JouneyMan Hours",
            "mobid": "3238432-2"
          },
          {
            "Hrclsidd": 130,
            "Hrclscod": "JMAN",
            "Hours": "4.3",
            "Htdesc": "JouneyMan Hours",
            "mobid": "3238432-3"
          }
        ],

      "PremiumTypeList":
        [
          {
            "Prtidd": 130,
            "Prtcod": "Shift",
            "Prtval": "1.00",
            "ptdesc": "Shift Premium for the day",
            "mobid": "3238432"
          },
          {
            "Prtidd": 130,
            "Prtcod": "Travel",
            "Prtval": "1.00",
            "ptdesc": "Travel Premium for the day",
            "mobid": "3238432"
          }
        ],

      "EmpHourTypePremiumTypeList":
        [
          {
            "hrtdidd": 130,
            "prtidd": "1",
            "prtcod": "Shift",
            "prtval": "1",
            "prtdesc": "Shift1",
            "mobid": "3238432-2"
          }
        ]


    };
    return mp;

  }

  SaveForm() {}
  submitForm() {
    String username = id;
    String password = pas;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    return http.post(
      'http://smemobapi.azurewebsites.net/api/TimeSheetTransaction/InsertTimeSheet?UserId=3130',
      headers: <String, String>{
        'Host': "smemobapi.azurewebsites.net",
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(getMapdata()


          ),
    );
  }

  attachForm() {}
  timelineForm() {}

  TextEditingController date_controller1 = TextEditingController();
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
            print(index);
            if (index == 0) {}

            if (index == 1) {
              submitForm();
            }
            if (index == 2) {}
            if (index == 3) {}
          },
        ),
      ],
    );
  }

  getdatafromparameter() async {
    if (!fresh) return 1;

    fresh = false;

    date_controller1.text = DateFormat('dd-MMMM-yyyy').format(DateTime.now());

    TimeSheetParameter timeSheetParameter = TimeSheetParameter.instance;

    List ls = await timeSheetParameter.queryAllRows();
    if (ls.length == 0) return 0;

    Map mp = ls.last;
    dropDown_timeSheet.dependentDropDown_1.DropDownValue =
        mp[TimeSheetParameter.prjtypetitle];
    dropDown_timeSheet.dependentDropDown_2.DropDownValue =
        mp[TimeSheetParameter.prjtitle];
    dropDown_timeSheet.dependentDropDown_3.DropDownValue =
        mp[TimeSheetParameter.prjdtailtitle];
    dropDown_timeSheet.dependentDropDown_4.DropDownValue =
        mp[TimeSheetParameter.prjsbdtailtitle];
    dropDown_timeSheet.independentDropDown_1.DropDownValue =
        mp[TimeSheetParameter.indpndnttitle];
    dropDown_timeSheet.independentDropDown_2.DropDownValue =
        mp[TimeSheetParameter.indpndnt2title];

    dropDown_timeSheet.dependentDropDown_1.DefaultVAl =
        mp[TimeSheetParameter.prjtypetitle];
    dropDown_timeSheet.dependentDropDown_2.DefaultVAl =
        mp[TimeSheetParameter.prjtitle];
    dropDown_timeSheet.dependentDropDown_3.DefaultVAl =
        mp[TimeSheetParameter.prjdtailtitle];
    dropDown_timeSheet.dependentDropDown_4.DefaultVAl =
        mp[TimeSheetParameter.prjsbdtailtitle];
    dropDown_timeSheet.independentDropDown_1.DefaultVAl =
        mp[TimeSheetParameter.indpndnttitle];
    dropDown_timeSheet.independentDropDown_2.DefaultVAl =
        mp[TimeSheetParameter.indpndnt2title];

    dropDown_timeSheet.dependentDropDown_1.isvisible =
        istrue(mp[TimeSheetParameter.isprjtpe]);
    dropDown_timeSheet.dependentDropDown_2.isvisible =
        istrue(mp[TimeSheetParameter.isprjvis]);
    dropDown_timeSheet.dependentDropDown_3.isvisible =
        istrue(mp[TimeSheetParameter.isprjdtail]);
    dropDown_timeSheet.dependentDropDown_4.isvisible =
        istrue(mp[TimeSheetParameter.isprjsbdtail]);
    dropDown_timeSheet.independentDropDown_1.isvisible =
        istrue(mp[TimeSheetParameter.isindpndnt]);
    dropDown_timeSheet.independentDropDown_2.isvisible =
        istrue(mp[TimeSheetParameter.isindpndnt2]);

    dropDown_timeSheet.position.isvisible =
        istrue(mp[TimeSheetParameter.isddlposvis]);

    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: th.bk,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              TopBar(th, Screen_type.Time_Sheet),
              Positioned(
                right: 10,
                top: 30,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              Detail_Form(Screen_type.Hours_Detail, th),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              Detail_Form(Screen_type.Premiums_Detail, th),
                        );
                      },
                      icon: Icon(Icons.timer, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: getdatafromparameter(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return ModalProgressHUD(
                      inAsyncCall: true,
                      child: Container(),
                    );
                  }
                  return ListView(
                    children: <Widget>[
                      formrow(dropDown_timeSheet.emp_Code.DropDownValue, () {
                        showDialog(
                            context: context,
                            builder: (context) => SizedBox(
                                width: 50,
                                height: 50,
                                child: Seacrable_Listview(widget.th, "Search",
                                    this, this, dropDown_timeSheet.emp_Code)));
                      }),
                      formrow(
                        date_controller1.text,
                        () async {
                          var datePicked =
                              await DatePicker.showSimpleDatePicker(
                            context,
                            initialDate: DateTime(2020),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2024),
                            dateFormat: "dd-MMMM-yyyy",
                            locale: DateTimePickerLocale.en_us,
                            looping: true,
                          );
                          setState(() {
                            date_controller1.text =
                                DateFormat('dd-MMMM-yyyy').format(datePicked);
                          });
                          final snackBar = SnackBar(
                              content: Text("Date Picked $datePicked"));
                          Scaffold.of(context).showSnackBar(snackBar);
                        },
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.blueAccent,
                          size: 25,
                        ),
                      ),
                      if (dropDown_timeSheet.dependentDropDown_1.isvisible)
                        formrow(
                            dropDown_timeSheet
                                .dependentDropDown_1.DropDownValue, () {
                          showDialog(
                              context: context,
                              builder: (context) => SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Seacrable_Listview(
                                    widget.th,
                                    "Search",
                                    this,
                                    this,
                                    dropDown_timeSheet.dependentDropDown_1,
                                  )));
                        }),
                      if (dropDown_timeSheet.dependentDropDown_2.isvisible)
                        formrow(
                            dropDown_timeSheet
                                .dependentDropDown_2.DropDownValue, () {
                          showDialog(
                              context: context,
                              builder: (context) => SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Seacrable_Listview(
                                      widget.th,
                                      "Search",
                                      this,
                                      this,
                                      dropDown_timeSheet.dependentDropDown_2)));
                        }),
                      if (dropDown_timeSheet.dependentDropDown_3.isvisible)
                        formrow(
                            dropDown_timeSheet
                                .dependentDropDown_3.DropDownValue, () {
                          showDialog(
                              context: context,
                              builder: (context) => SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Seacrable_Listview(
                                      widget.th,
                                      "Search",
                                      this,
                                      this,
                                      dropDown_timeSheet.dependentDropDown_3)));
                        }),
                      if (dropDown_timeSheet.dependentDropDown_4.isvisible)
                        formrow(
                            dropDown_timeSheet
                                .dependentDropDown_4.DropDownValue, () {
                          showDialog(
                              context: context,
                              builder: (context) => SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Seacrable_Listview(
                                      widget.th,
                                      "Search",
                                      this,
                                      this,
                                      dropDown_timeSheet.dependentDropDown_4)));
                        }),
                      if (dropDown_timeSheet.independentDropDown_1.isvisible)
                        formrow(
                            dropDown_timeSheet
                                .independentDropDown_1.DropDownValue, () {
                          showDialog(
                              context: context,
                              builder: (context) => SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Seacrable_Listview(
                                      widget.th,
                                      "Search",
                                      this,
                                      this,
                                      dropDown_timeSheet
                                          .independentDropDown_1)));
                        }),
                      if (dropDown_timeSheet.independentDropDown_2.isvisible)
                        formrow(
                            dropDown_timeSheet
                                .independentDropDown_2.DropDownValue, () {
                          showDialog(
                              context: context,
                              builder: (context) => SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Seacrable_Listview(
                                      widget.th,
                                      "Search",
                                      this,
                                      this,
                                      dropDown_timeSheet
                                          .independentDropDown_2)));
                        }),
                      if (dropDown_timeSheet.position.isvisible)
                        formrow(dropDown_timeSheet.position.DropDownValue, () {
                          showDialog(
                              context: context,
                              builder: (context) => SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Seacrable_Listview(
                                      widget.th,
                                      "Search",
                                      this,
                                      this,
                                      dropDown_timeSheet.position)));
                        }),
                      textboxrow(
                          "Type your comments here", 1, TextInputType.text),
                    ],
                  );
                }),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.15,
              alignment: Alignment.bottomCenter,
              child: bottomBar()),
        ],
      ),
    );
  }

  Widget formrow(valuestr, Function fnction, {icon}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.0, color: Hexcolor('#DAE0F9')),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 8, left: 8, bottom: 0, top: 5),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    fnction();
                    print("clicked press");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          valuestr ?? '',
                          style: GoogleFonts.roboto(
                            color: th.pr,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      icon ??
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.blueAccent,
                            size: 25,
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textboxrow(str, num, input) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 3),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        onTap: () {
//          checkAppPosition(i);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Theme(
                  data: new ThemeData(
                    primaryColor: Colors.redAccent,
                    primaryColorDark: Colors.red,
                  ),
                  child: new TextField(
                    style: TextStyle(color: th.pr),
                    keyboardType: input,
                    controller:
                        num == 1 ? Comentr_Controler : TextEditingController(),
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: th.pr)),
                        hintText: str,
                        helperText: '',
                        labelText: str,
//                        prefixIcon: const Icon(
//                          Icons.person,
//                          color: Colors.green,
//                        ),
                        prefixText: ' ',
                        suffixText: '',
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Premiumtypedata{
  Premiumtypedata() {
    var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    getRandomString(int length) => String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    mobid = DateTime.now().millisecondsSinceEpoch.toString() +  getRandomString(10);
  }

  String mobid;
  String Prtidd;
  String Prtcod;
  String Prtval;
  String ptdesc;
}