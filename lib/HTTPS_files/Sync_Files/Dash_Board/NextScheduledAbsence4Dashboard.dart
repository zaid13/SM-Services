
import 'dart:convert';
import 'package:http/http.dart';

import 'dart:convert' as JSON;

import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/ScheduledAbsence.dart';


initNextScheduledAbsence4Dashboard(username, password,empid) async {
  insering_allDB dbvar = insering_allDB();

  String gtr =  GetNextScheduledAbsence4Dashboard + uid;


  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));


  Response r = await get(gtr  ,
      headers: <String, String>{'authorization': basicAuth});


  if(r.statusCode==200){
    final json=JSON.jsonDecode(r.body);
    ScheduledAbsence scheduledAbsence = ScheduledAbsence.instance;
    scheduledAbsence.deleteall();
    List lst = json;
    lst.forEach((element) {


      dbvar.insert_scheduledAbsence(
        EmployeeCode:element['${ScheduledAbsence.EmployeeCode}'].toString(),
        LeaveCode: element['${ScheduledAbsence.LeaveCode}'],
        FromDate: element['${ScheduledAbsence.FromDate}'],
        ToDate: element['${ScheduledAbsence.ToDate}'],
        FromTime:  element['${ScheduledAbsence.FromTime}'],
        Hourly: element['${ScheduledAbsence.Hourly}'],
        ToTime:  element['${ScheduledAbsence.ToTime}'],
      );
    });


  }
}
