import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:file_picker/file_picker.dart';
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
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Hour.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Hour_Premium.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Premium.dart';
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
// import 'package:file_picker/file_picker.dart';
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

import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD2.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlattenttrx_Status.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_prt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_hrt_prt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatm.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_hrt.dart';

import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD2.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlattenttrx_Status.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_prt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_hrt_prt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatm.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlattenttrx_Status.dart';

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
  List<TabIconData> tabIconsList=TabIconData.tabIconsList;
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  bool fresh = true;
  @override
  void initState() {
    th = widget.th;
    assignBottomIcon();
  }

  assignBottomIcon() {

    popularFilterListData.forEach((element) {
      element.isSelected = false;
    });
  }

  List<PopularFilterListData> popularFilterListData =
      PopularFilterListData.popularFList;

  var Comentr_Controler = TextEditingController();
  getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  getMapdata() async {
    await SaveForm();

    final Eb_prlempatd_hrt = eb_prlempatd_hrt.instance;
    final Eb_prlempatd_prt = eb_prlempatd_prt.instance;
    final Eb_prlempatd_hrt_prt = eb_prlempatd_hrt_prt.instance;
    final Eb_prlempatt = eb_prlempatt.instance;
    final Eb_prlempatm = eb_prlempatm.instance;

    List demo = await Eb_prlempatd_prt.queryAllRows();
    demo.forEach((element) {

    });

    List lsTime =
        await Eb_prlempatd_hrt.queryonlyRows(FormId, eb_prlempatd_hrt.mobid);
    List lsPremium =
        await Eb_prlempatd_prt.queryonlyRows(FormId, eb_prlempatd_prt.mobid);
    List lsTime_Premium = await Eb_prlempatd_hrt_prt.queryonlyRows(
        FormId, eb_prlempatd_hrt_prt.mobid);
    List lsEb_prlempatt =
        await Eb_prlempatt.queryonlyRows(FormId, eb_prlempatd_hrt_prt.mobid);
    List lsEb_prlempatm =
        await Eb_prlempatm.queryonlyRows(FormId, eb_prlempatd_hrt_prt.mobid);

    Map MAPlsEb_prlempatt;

    Map MAPlsEb_prlempatm;
    if (lsEb_prlempatt.length > 0) {
      MAPlsEb_prlempatt = lsEb_prlempatt[0];
    } else {

      return {};
    }

    if (lsEb_prlempatm.length > 0) {
      MAPlsEb_prlempatm = lsEb_prlempatm[0];
    } else {

      return {};
    }

    List mptime_upload = [];
    List mppremium_upload = [];
    List mptime_premium_upload = [];

    lsTime.forEach((element) {
      mptime_upload.add({
        "Hrclsidd": element[eb_prlempatd_hrt.hrclsidd],
        "Hrclscod": element[eb_prlempatd_hrt.hrclscod],

        ///TODO
        "Hours": element[eb_prlempatd_hrt.hours],
        "Htdesc": element[eb_prlempatd_hrt.htdesc],
        "mobid": element[eb_prlempatd_hrt.mobid]
      });
    });

    lsPremium.forEach((element) {

      mppremium_upload.add(
        {
          "Prtidd": element[eb_prlempatd_prt.prtidd],
          "Prtcod": element[eb_prlempatd_prt.prtcod],
          "Prtval": element[eb_prlempatd_prt.prtval],
          "ptdesc": element[eb_prlempatd_prt.ptdesc],
          "mobid": element[eb_prlempatd_prt.mobid]
        },
      );
    });

    lsTime_Premium.forEach((element) {
      mptime_premium_upload.add({
        "hrtdidd": element[eb_prlempatd_hrt_prt.hrtdidd],
        "prtidd": element[eb_prlempatd_hrt_prt.prtidd],
        "prtcod": element[eb_prlempatd_hrt_prt.prtcod],
        "prtval": element[eb_prlempatd_hrt_prt.prtval],
        "prtdesc": element[eb_prlempatd_hrt_prt.ptdesc],
        "mobid": element[eb_prlempatd_hrt_prt.mobid],
      });
    });

    Map mp = {
      "TimeSheetMainForm": {
        "EmpId": MAPlsEb_prlempatt[eb_prlempatt.empidd],
        "EmpCod": MAPlsEb_prlempatt[eb_prlempatt.empcod],
        "PositionId": MAPlsEb_prlempatm[eb_prlempatm.posidd],

        "PositionCod": returnNUlliFDefault(
            MAPlsEb_prlempatm[eb_prlempatm.poscod],
            dropDown_timeSheet.position.DefaultVAl), //turn null if
        "DependantDD1ID": MAPlsEb_prlempatm[eb_prlempatm.prjtypidd],
        "DependantDD2ID": MAPlsEb_prlempatm[eb_prlempatm.prjidd],
        "DependantDD3ID": MAPlsEb_prlempatm[eb_prlempatm.subprjidd],
        "DependantDD4ID": MAPlsEb_prlempatm[eb_prlempatm.prjsbdtidd],
        "DependantDD1Code": MAPlsEb_prlempatm[eb_prlempatm.prjtypcod],
        "DependantDD2Code": MAPlsEb_prlempatm[eb_prlempatm.prjcod],
        "DependantDD3Code": MAPlsEb_prlempatm[eb_prlempatm.subprjcod],
        "DependantDD4Code": MAPlsEb_prlempatm[eb_prlempatm.prjsbdtcod],
        "IndependentDD1Id": MAPlsEb_prlempatm[eb_prlempatm.indepndtidd],
        "IndependentDD1Code": MAPlsEb_prlempatm[eb_prlempatm.indepndtcod],
        "IndependentDD2Id": MAPlsEb_prlempatm[eb_prlempatm.indepndtidd2],
        "IndependentDD2Code": MAPlsEb_prlempatm[eb_prlempatm.indepndtcod2],
        "Date": MAPlsEb_prlempatm[eb_prlempatm.attdat],
        "Attchment": '""',
        "mobid": FormId
      },
      "EmpHourTypeList": mptime_upload,
      // [
      //   // {
      //   //   "Hrclsidd": 130,
      //   //   "Hrclscod": "JMANOT",
      //   //   "Hours": "8.00",
      //   //   "Htdesc": "JMAN Overtime",
      //   //   "mobid": "32384321-1"
      //   // },
      //   // {
      //   //   "Hrclsidd": 130,
      //   //   "Hrclscod": "JMAN",
      //   //   "Hours": "4.3",
      //   //   "Htdesc": "JouneyMan Hours",
      //   //   "mobid": "3238432-2"
      //   // },
      //   // {
      //   //   "Hrclsidd": 130,
      //   //   "Hrclscod": "JMAN",
      //   //   "Hours": "4.3",
      //   //   "Htdesc": "JouneyMan Hours",
      //   //   "mobid": "3238432-3"
      //   // }
      // ],

      "PremiumTypeList": mppremium_upload,
      // [
      //   {
      //     "Prtidd": 130,
      //     "Prtcod": "Shift",
      //     "Prtval": "1.00",
      //     "ptdesc": "Shift Premium for the day",
      //     "mobid": "3238432"
      //   },
      //   {
      //     "Prtidd": 130,
      //     "Prtcod": "Travel",
      //     "Prtval": "1.00",
      //     "ptdesc": "Travel Premium for the day",
      //     "mobid": "3238432"
      //   }
      // ],

      "EmpHourTypePremiumTypeList": mptime_premium_upload
      // [
      //   {
      //     "hrtdidd": 130,
      //     "prtidd": "1",
      //     "prtcod": "Shift",
      //     "prtval": "1",
      //     "prtdesc": "Shift1",
      //     "mobid": "3238432-2"
      //   }
      // ]
    };
    return mp;
  }

  SaveForm() async {
    String saveMobID = FormId;
    insering_allDB alldb = insering_allDB();
    alldb.inserteb_prlempatt(
        recidd: "0",
        isdeleted: "0",
        cmpidd: "0",
        Company: "",
        empcod: dropDown_timeSheet.emp_Code.empcodeForSubmission,
        empidd: dropDown_timeSheet.emp_Code.DropDownCode,
        employeeuserid: uid,
        prmtrx: "",
        remarks: Comentr_Controler.text,
        requestdate: DateFormat('dd-MMMM-yyyy').format(DateTime.now()),
        status: "0",
        submittedbyuserid: uid,
        workflowmasterid: "0",
        mobid: saveMobID);
    alldb.inserteb_prlempatm(
        mobid: saveMobID,
        prmtrx: 0,
        empcod: dropDown_timeSheet.emp_Code.empcodeForSubmission,
        empidd: dropDown_timeSheet.emp_Code.DropDownCode,
        posidd: dropDown_timeSheet.position.DropDownCode,
        poscod: returnNUlliFDefault(dropDown_timeSheet.position.DropDownValue,
            dropDown_timeSheet.position.DefaultVAl),
        Company: "",
        cmpidd: 0,
        isdeleted: 0,
        recidd: 0,
        attcmt: Comentr_Controler.text,
        attdat: date_controller1.text,
        attetm: 0,
        attftm: 0,
        attseq: 0,
        atttcd: 0,
        atttyp: 1,
        calcod: "",
        calidd: 0,
        indepndtcod2: dropDown_timeSheet.independentDropDown_2.DropDownValue,
        indepndtidd2: dropDown_timeSheet.independentDropDown_2.DropDownCode,
        indepndtcod: dropDown_timeSheet.independentDropDown_1.DropDownValue,
        indepndtidd: dropDown_timeSheet.independentDropDown_2.DropDownCode,
        prjcod: dropDown_timeSheet.dependentDropDown_2.DropDownValue,
        prjidd: dropDown_timeSheet.dependentDropDown_2.DropDownCode,
        prjsbdtcod: dropDown_timeSheet.dependentDropDown_4.DropDownValue,
        prjsbdtidd: dropDown_timeSheet.dependentDropDown_4.DropDownCode,
        prjtypcod: dropDown_timeSheet.dependentDropDown_1.DropDownValue,
        prjtypidd: dropDown_timeSheet.dependentDropDown_1.DropDownCode,
        prmidd: 0,
        shfidd: 0,
        shftcod: 0,
        shtval: "",
        subprjcod: dropDown_timeSheet.dependentDropDown_3.DropDownValue,
        subprjidd: dropDown_timeSheet.dependentDropDown_3.DropDownCode,
        subtrx: 0);

    Timesheet_Hour timesheet_hour = Timesheet_Hour.instance;
    Timesheet_Premium timesheet_premium = Timesheet_Premium.instance;
    Timesheet_Hour_Premium timesheet_hour_premium =
        Timesheet_Hour_Premium.instance;

    List lsTime =
        await timesheet_hour.queryonlyRows(FormId, Timesheet_Hour.mobid);
    List lsPremium =
        await timesheet_premium.queryonlyRows(FormId, Timesheet_Premium.mobid);
    List lsTime_Premium = await timesheet_hour_premium.queryonlyRows(
        FormId, Timesheet_Hour_Premium.mobid);

    lsTime.forEach((element) {
      alldb.inserteb_prlempatd_hrt(
        recidd: 0,
        isdeleted: 0,
        cmpidd: 0,
        Company: "",
        mobid: element[Timesheet_Hour.mobid],
        mrecidd: 0,
        htdesc: element[Timesheet_Hour.htdesc],
        hrclsidd: element[Timesheet_Hour.hrclsidd],
        hrclscod: element[Timesheet_Hour.hrclscod],

        ///TODO
        hours: element[Timesheet_Hour.hours],
      );
    });
    lsPremium.forEach((element) {
      alldb.inserteb_prlempatd_prt(
        mrecidd: 0,
        mobid: element[Timesheet_Premium.mobid],
        Company: "",
        cmpidd: 0,
        isdeleted: 0,
        recidd: 0,
        prtcod: element[Timesheet_Premium.prtcod],
        prtidd: element[Timesheet_Premium.prtidd],
        prtval: element[Timesheet_Premium.prtval],
        ptdesc: element[Timesheet_Premium.ptdesc],
      );
    });
    lsTime_Premium.forEach((element) {
      alldb.inserteb_prlempatd_hrt_prt(
        mrecidd: 0,
        mobid: element[Timesheet_Hour_Premium.mobid],
        Company: "",
        cmpidd: 0,
        isdeleted: 0,
        recidd: 0,
        prtcod: element[Timesheet_Hour_Premium.prtcod],
        prtidd: element[Timesheet_Hour_Premium.prtidd],
        prtval: element[Timesheet_Hour_Premium.prtval],
        ptdesc: element[Timesheet_Hour_Premium.ptdesc],
        hrtdidd: element[Timesheet_Hour_Premium.hrtdidd],
      );
    });
  }

  submitForm() async {
    printall_table();

    String username = id;
    String password = pas;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var data = await getMapdata();

    Response p = await http.post(
      'http://smemobapi.azurewebsites.net/api/TimeSheetTransaction/InsertTimeSheet?UserId=$uid',
      headers: <String, String>{
        'Host': "smemobapi.azurewebsites.net",
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );



    Response g = await http.get(
      'http://smemobapi.azurewebsites.net/api/TimeSheetTransaction/GetTimeSheetFullRecordset?mobid=$FormId',
      headers: <String, String>{
        'Host': "smemobapi.azurewebsites.net",
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
    );


    final json = JSON.jsonDecode(g.body);

    final Eb_prlempatd_hrt = eb_prlempatd_hrt.instance;
    final Eb_prlempatd_prt = eb_prlempatd_prt.instance;
    final Eb_prlempatd_hrt_prt = eb_prlempatd_hrt_prt.instance;
    final Eb_prlempatt = eb_prlempatt.instance;
    final Eb_prlempatm = eb_prlempatm.instance;
    final Eb_prlattenttrx_Status = eb_prlattenttrx_Status.instance;

    List demo = await Eb_prlempatd_prt.queryAllRows();


    await Eb_prlempatd_hrt.deleteonly(FormId, eb_prlempatd_hrt.mobid);
    await Eb_prlempatd_prt.deleteonly(FormId, eb_prlempatd_prt.mobid);
    await Eb_prlempatd_hrt_prt.deleteonly(FormId, eb_prlempatd_hrt_prt.mobid);
    await Eb_prlempatt.deleteonly(FormId, eb_prlempatd_hrt_prt.mobid);
    await Eb_prlempatm.deleteonly(FormId, eb_prlempatd_hrt_prt.mobid);

    String saveMobID = FormId;
    insering_allDB alldb = insering_allDB();
    // alldb.inserteb_prlempatt );
    Eb_prlempatt.insert(json['eb_prlempatt'][0]);
    Eb_prlempatm.insert(json['eb_prlempatm'][0]);

    Eb_prlattenttrx_Status.insert(json['eb_prlattenttrx_Status'][0]);
    List lsTime = json[
        'eb_prlempatd_hrt']; //await timesheet_hour.queryonlyRows(FormId, Timesheet_Hour.mobid);
    List lsPremium = json[
        'eb_prlempatd_prt']; //await timesheet_premium.queryonlyRows(FormId,Timesheet_Premium.mobid);
    List lsTime_Premium = json[
        'eb_prlempatd_hrt_prt']; //await timesheet_hour_premium.queryonlyRows(FormId,Timesheet_Hour_Premium.mobid);

    lsTime.forEach((element) {
      alldb.inserteb_prlempatd_hrt(
        recidd: 0,
        isdeleted: 0,
        cmpidd: 0,
        Company: "",
        mobid: element[Timesheet_Hour.mobid],
        mrecidd: 0,
        htdesc: element[Timesheet_Hour.htdesc],
        hrclsidd: element[Timesheet_Hour.hrclsidd],
        hrclscod: element[Timesheet_Hour.hrclscod],

        ///TODO
        hours: element[Timesheet_Hour.hours],
      );
    });
    lsPremium.forEach((element) {
      alldb.inserteb_prlempatd_prt(
        mrecidd: 0,
        mobid: element[Timesheet_Premium.mobid],
        Company: "",
        cmpidd: 0,
        isdeleted: 0,
        recidd: 0,
        prtcod: element[Timesheet_Premium.prtcod],
        prtidd: element[Timesheet_Premium.prtidd],
        prtval: element[Timesheet_Premium.prtval],
        ptdesc: element[Timesheet_Premium.ptdesc],
      );
    });
    lsTime_Premium.forEach((element) {
      alldb.inserteb_prlempatd_hrt_prt(
        mrecidd: 0,
        mobid: element[Timesheet_Hour_Premium.mobid],
        Company: "",
        cmpidd: 0,
        isdeleted: 0,
        recidd: 0,
        prtcod: element[Timesheet_Hour_Premium.prtcod],
        prtidd: element[Timesheet_Hour_Premium.prtidd],
        prtval: element[Timesheet_Hour_Premium.prtval],
        ptdesc: element[Timesheet_Hour_Premium.ptdesc],
        hrtdidd: element[Timesheet_Hour_Premium.hrtdidd],
      );
    });
    printall_table();
    changeFormid();
  }

  attachForm() {}
  timelineForm() {}

  TextEditingController date_controller1 = TextEditingController();
  Widget bottomBar() {
return    Container(
  height: MediaQuery.of(context).size.height * 0.12,
  child:   BottomBarView(

        tabIconsList: tabIconsList,

        addClick: () {

  //            RESET_SCREEN();

        },

        changeIndex: (int index) async {



          if (index == 0) {

            SaveForm();

          }



          if (index == 1) {

            await submitForm();

          }

          if (index == 2) {}

          if (index == 3) {}

        },

      ),
);
  }

  loadDataAccordingScreen()  async {
    if (widget.screentype == Screen_type.Time_Sheet) {   }

    if (widget.screentype == Screen_type.Saved_timesheet) {}
    if (widget.screentype == Screen_type.Submitted_timesheet) {}
    if (widget.screentype == Screen_type.Pending_timesheet) {}
    if (widget.screentype == Screen_type.Request_timesheet) {
      return getdatafromparameter();
    }
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

  String FormId = getID();

  changeFormid() {


    FormId = getID();

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
                        Icons.timer,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              Detail_Form(Screen_type.Hour_, th, FormId),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              Detail_Form(Screen_type.Premium_, th, FormId),
                        );
                      },
                      icon: Icon(Icons.settings, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: loadDataAccordingScreen(),
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
                                child: Seacrable_Listview(widget.th, "Employee",
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
                                    "Project Type",
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
                                      "Project Location",
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
                                      "Project Code",
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
                                      "Project Detail Code",
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
                                      "Cost Code",
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
                                      "Profit Center",
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
                                      "Position",
                                      this,
                                      this,
                                      dropDown_timeSheet.position)));
                        }),
                      textboxrow(
                          "Type your comments here", 1, TextInputType.text

                      ),
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
                  bottom: BorderSide(width: 2.0, color: HexColor('#DAE0F9')),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 8, left: 8, bottom: 0, top: 5),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    fnction();

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
                        hintStyle: TextStyle(color: th.pr),
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

printall_table() async {
  final Eb_prlempatd_hrt = eb_prlempatd_hrt.instance;
  final Eb_prlempatd_prt = eb_prlempatd_prt.instance;
  final Eb_prlempatd_hrt_prt = eb_prlempatd_hrt_prt.instance;
  final Eb_prlempatt = eb_prlempatt.instance;
  final Eb_prlempatm = eb_prlempatm.instance;
  final Eb_prlattenttrx_Status = eb_prlattenttrx_Status.instance;

  List lsEb_prlempatm = await Eb_prlempatm.queryAllRows();
  List lsEb_prlempatt = await Eb_prlempatt.queryAllRows();
  List lsEb_prlattenttrx_Status = await Eb_prlattenttrx_Status.queryAllRows();
  List lsEb_prlempatd_hrt = await Eb_prlempatd_hrt.queryAllRows();
  List lsEb_prlempatd_prt = await Eb_prlempatd_prt.queryAllRows();
  List lsEb_prlempatd_hrt_prt = await Eb_prlempatd_hrt_prt.queryAllRows();

  lsEb_prlempatm.forEach((element) {
    print('lsEb_prlempatm\n');
    print(element);
  });
  lsEb_prlempatt.forEach((element) {
    print('lsEb_prlempatt\n');
    print(element);
  });
  lsEb_prlattenttrx_Status.forEach((element) {
    print('lsEb_prlattenttrx_Status\n');
    print(element);
  });
  lsEb_prlempatd_hrt.forEach((element) {
    print('lsEb_prlempatd_hrt\n');
    print(element);
  });
  lsEb_prlempatd_prt.forEach((element) {
    print('lsEb_prlempatd_prt\n');
    print(element);
  });
  lsEb_prlempatd_hrt_prt.forEach((element) {
    print('lsEb_prlempatd_hrt_prt\n');
    print(element);
  });
}
