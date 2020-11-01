import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:path/path.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sm_service/AppScreens/Settings/Settings_screen.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Local_DB/Dark.dart';
import 'package:sm_service/Database_Files/Local_DB/SigninUser.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/EmpMaster_timesheet.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/Hour_Type.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD2.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD3.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD4.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/HourType/Hour_Type.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_2.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Position.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Hour.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Hour_Premium.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Premium.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/TimeSheetParameter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/NotificationCount.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/ScheduledAbsence.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/VacationBalance.dart';
import 'package:sm_service/Database_Files/Local_DB/Menu.dart';
import 'package:sm_service/Database_Files/Server_Files/AbsenceCodes.dart';
import 'package:sm_service/Database_Files/Server_Files/AbsenceParameters.dart';
import 'package:sm_service/Database_Files/Server_Files/AbsenceTypes.dart';
import 'package:sm_service/Database_Files/Server_Files/CalendarDetails.dart';
import 'package:sm_service/Database_Files/Server_Files/CalendarHolidays.dart';
import 'package:sm_service/Database_Files/Server_Files/CalendarShifts.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/Database_Files/Server_Files/EmpAbsenceAssignments.dart';
import 'package:sm_service/Database_Files/Server_Files/EmpMaster.dart';
import 'package:sm_service/Database_Files/Server_Files/EmployeeAbsenceCodeAssignment.dart';
import 'package:sm_service/Database_Files/Server_Files/VacationEntryType.dart';


import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_startup/flutter_startup.dart';
import 'package:flutter_isolate/flutter_isolate.dart';

import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlattenttrx_Status.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_prt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_hrt_prt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatm.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_hrt.dart';

Future<theme> gettheme () async {
  theme th= theme();
  Dark DARK  = Dark.instance;
  int cntdark = await DARK.queryRowCount();


  if(cntdark==0){

    DARK.insert({Dark.isDark:0});

    th.bk = Day().bk;
    th.pr = Day().pr;


  }
  else{
    List ls = await DARK.queryAllRows();
    Map mp = ls.first;
    int i =  mp['${Dark.isDark}'];


    if(i==0){

      th.bk = Day().bk;
      th.pr = Day().pr;
    }
    else{

      th.bk = Night().bk;
      th.pr = Night().pr;
    }


  }
  return th;

}

registernewuser(LoginData  dt,id ){


  final signin  = SigninUser.instance;

  signin.insert({
    SigninUser.user:dt.name,
    SigninUser.pass:dt.password,
    SigninUser.id:id


  });
}



Future onCreate(Database db, int version) async {
  await SigninUser.instance.onCreate(db, version);
  await Dark.instance.onCreate(db, version);
  await Menu.instance.onCreate(db, version);
  await EmpMaster.instance.onCreate(db, version);
  await EmpAbsenceAssignments.instance.onCreate(db, version);
  await AbsenceTypes.instance.onCreate(db, version);
  await AbsenceCodes.instance.onCreate(db, version);

  await CalendarDetails.instance.onCreate(db, version);
  await CalendarShifts.instance.onCreate(db, version);
  await CalendarHolidays.instance.onCreate(db, version);
  await AbsenceParameters.instance.onCreate(db, version);
  await VacationEntryType.instance.onCreate(db, version);
  await EmployeeAbsenceCodeAssignment.instance.onCreate(db, version);
  await Absence_Transaction.instance.onCreate(db, version);
  await Eb_prllevtrx_status.instance.onCreate(db, version);
  await ScheduledAbsence.instance.onCreate(db, version);
  await VacationBalance.instance.onCreate(db, version);
  await NotificationCount.instance.onCreate(db, version);



  await TimeSheetParameter.instance.onCreate(db, version);
  await EmpMaster_Timesheet.instance.onCreate(db, version);

  await ProjectD1.instance.onCreate(db, version);
  await ProjectD2.instance.onCreate(db, version);
  await ProjectD3.instance.onCreate(db, version);
  await ProjectD4.instance.onCreate(db, version);
  await Independent_dropDown_1.instance.onCreate(db, version);
  await Independent_dropDown_2.instance.onCreate(db, version);

  await Premium_type_db.instance.onCreate(db, version);
  await HourTypes.instance.onCreate(db, version);

  await Timesheet_Hour_Premium.instance.onCreate(db, version);
  await Timesheet_Premium.instance.onCreate(db, version);
  await Timesheet_Hour.instance.onCreate(db, version);



 await  eb_prlempatt.instance.onCreate(db, version);
  await eb_prlempatm.instance.onCreate(db, version);
 await  eb_prlattenttrx_Status.instance.onCreate(db, version);
  await eb_prlempatd_hrt.instance.onCreate(db, version);
 await  eb_prlempatd_prt.instance.onCreate(db, version);
 await  eb_prlempatd_hrt_prt.instance.onCreate(db, version);
  // await eb_prlattenttrx_Status.instance.onCreate(db, version);
  // await Timesheet_Hour.instance.onCreate(db, version);
  // await Timesheet_Hour.instance.onCreate(db, version);
  // await Timesheet_Hour.instance.onCreate(db, version);
  // await Timesheet_Hour.instance.onCreate(db, version);
  // await Timesheet_Hour.instance.onCreate(db, version);
  Directory d =await getApplicationDocumentsDirectory();
print(d.path);






}


createdb() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();

  path = join(documentsDirectory.path, "DB.db");
  return  await openDatabase(path,
      version: 1, onCreate: onCreate);

}




Future<bool> checkServerConnection(link ,Username ,Password ) async {


  try {
    final result = await InternetAddress.lookup('smemobapi.azurewebsites.net');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;

  }

}
GetCurrdate(){

  return DateTime.now();



}

SMTP_Email(String mess) async {


  String username = 'testmysettings6@gmail.com';
  String password = 'testing5000';

//  final smtpServer = gmail(username, password);
  // Use the SmtpServer class to configure an SMTP server:
   final smtpServer = SmtpServer('smtp.gmail.com',port: 587,ssl: true,
   username: username,
     password: password,


   );
  // See the named arguments of SmtpServer for further configuration
  // options.

  // Create our message.
  final message = Message()
    ..from = Address(username, 'SM SERVICES')
    ..recipients.add('zaiddotco@gmail.com')

    ..ccRecipients.addAll(['salmanfazal@gmail.com'])
//    ..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = ' ERROR :: 😀 :: ${DateTime.now()}'
    ..text = 'Error was :'+mess
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }

}

}

bool istrue(String  i ){

  print(i);

  if(i.compareTo('True')==0)
    return true;

  else
    return false;

}




sec5Timer() {
  Timer.periodic(Duration(minutes: syncMinutes), (timer) {
    if (!isAuto) {
      timer.cancel();
    }
    AutoSync();
    print("Dekhi 5 sec por por kisu hy ni :/");
  });
}




String  getID() {
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  return  DateTime.now().millisecondsSinceEpoch.toString() +  getRandomString(10);
}



returnNUlliFDefault(String currva, String defval){
  if(currva==null)
    return currva;
print(currva);
print(defval);
 if( currva.compareTo(defval)==0){
   return null;


 }
 return currva;


}