import 'dart:convert';
import 'package:http/http.dart';

import 'dart:convert' as JSON;

import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/ScheduledAbsence.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/VacationBalance.dart';




initGetVacationBalance4Dashboard( username, password) async {
  insering_allDB dbvar = insering_allDB();


  String gtr  = GetVacationBalance4Dashboard + empid;
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));


  Response r = await get(gtr  ,
      headers: <String, String>{'authorization': basicAuth});



  if(r.statusCode==200){
    final json=JSON.jsonDecode(r.body);
    List lst = json;
    VacationBalance vacationBalance = VacationBalance.instance;
    vacationBalance.deleteall();
    lst.forEach((element) {
      dbvar.insert_vacationBalance(
          LeaveCode: element['${VacationBalance.LeaveCode}'],
          Balance: element['${VacationBalance.Balance}'],
          EmployeeCode:element['${VacationBalance.EmployeeCode}'] ,
          LeaveType: element['${VacationBalance.LeaveType}']

      );

    });



  }
}
