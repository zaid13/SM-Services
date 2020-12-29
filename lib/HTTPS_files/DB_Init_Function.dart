
import 'dart:convert';

import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';
import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD2.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD3.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD4.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/HourType/Hour_Type.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_2.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Position.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/PremiumType/PremiumType_db.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/TimeSheetParameter.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/HTTPS_files/Sync_Files/Dash_Board/GetVacationBalance4Dashboard.dart';
import 'package:sm_service/HTTPS_files/Sync_Files/Dash_Board/NextScheduledAbsence4Dashboard.dart';
import 'package:sm_service/HTTPS_files/Sync_Files/Dash_Board/NotificationCount.dart';
import 'dart:convert' as JSON;
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';


iningetmenu() async {

  insering_allDB dbvar = insering_allDB();

  String   GetMenu = 'http://smemobapi.azurewebsites.net/api/Menu/GetMenu?userid=$uid&module=Self%20Service&submod=Transactions&form=Absence%20Request';

  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$id:$pas'));
  Response r = await get(GetMenu  ,
      headers: <String, String>{'authorization': basicAuth});
  final json=JSON.jsonDecode(r.body);



  if(r.statusCode==200  && json.length>0){

    Map mp  = json[0];
    dbvar.insert_Menue(
        ID:mp['ID'],
        description:mp['Description'],
        subMenu: mp['SubMenu'],
        SubMod: mp['SubMod'],
        Url: mp['Url'],
        name: mp['Name']
    );

  }
  else{

  }


}

validateId(userid , userpass) async {
  String Validator = 'http://smemobapi.azurewebsites.net/api/Employee/ValidateCredentials?UserName=${userid}&Password=${userpass}';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$userid:$userpass'));
  Response r = await get(Validator  ,
      headers: <String, String>{'authorization': basicAuth});


  if(r.statusCode==200){
    final json=JSON.jsonDecode(r.body);

    id =userid;
    pas =userpass;
    uid = r.body;

    return r.body;
  }
  else{
    return null;
  }

}

getDataForMobidapiAsMap(String  Username ,String  Password  , String link ,String mobid) async {


  link = link +="?mobid=${mobid}";

  String username = Username;
  String password = Password;
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  Response r = await get(link,
      headers: <String, String>{'authorization': basicAuth});

  final json=JSON.jsonDecode(r.body);



  List ls = List.from(json)  ;

  return ls.first;

}

getapiAsMap(String  Username ,String  Password  , String link ,String userid,formtype) async {


  link = link +="?UserId=${userid}&FormType=${formtype}";


  String username = Username;
  String password = Password;
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  Response r = await get(link,
      headers: <String, String>{'authorization': basicAuth});

  final json=JSON.jsonDecode(r.body);
  Map ls = Map<String, dynamic>.from(json)  ;

  List maplis = [] ;

  maplis.add(ls);

  return maplis;
}

getapi(String  Username ,String  Password  , String link ,String userid,formtype) async {




  link = link +="?UserId=${userid}&FormType=${formtype}";

  String username = Username;
  String password = Password;
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

print(link);
  Response r = await get(link,
      headers: <String, String>{'authorization': basicAuth});



  final json=JSON.jsonDecode(r.body);
  List ls = json ;


  List maplis = [] ;
  for(var t in ls ){
    var mp =  Map<String, dynamic>.from(t);
    maplis.add(mp);


  }

  return maplis;
}

InsertAbsenceTransactionStatus(mobid) async {
  Map ls = await getDataForMobidapiAsMap(id,pas,GetInsertedAbsenceTransactionStatus ,mobid );
  ls.forEach((key, value) {
  });
  return ls;
}

InsertedAbsenceTransaction(mobid) async {


  Map ls = await getDataForMobidapiAsMap(id,pas,GetInsertedAbsenceTransaction ,mobid );

  ls.forEach((key, value) {
  });
  return ls;
}

initabsence_Transaction() async {
  insering_allDB dbvar = insering_allDB();


  List ls = await getapi(id,pas,GetEmpList4User ,uid,"3130" );
  for(var r = 0 ; r< 2 ;r++){

    dbvar.insert_Absence_Transaction(cmpidd: 1,Company: 1,airTicket: 1,calendarCode: 1,calendarDays:1,
        calendarIDD: 1,cashAmount: 1,cashCheck: 1,dayPercentage: 1 ,employeeCode:  1,employeeIDD: 1,
        EmployeeUserID: 1,entryDate: 1,entryType: 1,fromDate: 1,fromTime: 1,holidays: 1,hourly: 1,
        LeaveCode: 1,LeaveCodeIDD: 1, leavedays: 1,leaveSalary: 1,leaveTypeCode: 1,leaveTypeIDD: 1,
        NumberOfDays: 1,offHours: 1,OffMints: 1,perDiem: 1,recordIDD: 1,rejoiningDate: 1,remarks1: 1,
        remarks2: 1,RequestDate: 1,Status: 1,SubmittedByUserID: 1,toDate: 1,toTime: 1,transactionNumber: 1,
        TRX_ID: 1,weekendDays: 1,WorkflowMasterID: 1,mobid: 15268

    );


  }

  dbvar.insert_Absence_Transaction(cmpidd: 1,Company: 1,airTicket: 1,calendarCode: 1,calendarDays:1,
      calendarIDD: 1,cashAmount: 1,cashCheck: 1,dayPercentage: 1 ,employeeCode:  1,employeeIDD: 1,
      EmployeeUserID: 1,entryDate: 1,entryType: 1,fromDate: 1,fromTime: 1,holidays: 1,hourly: 1,
      LeaveCode: 1,LeaveCodeIDD: 1, leavedays: 1,leaveSalary: 1,leaveTypeCode: 1,leaveTypeIDD: 1,
      NumberOfDays: 1,offHours: 1,OffMints: 1,perDiem: 1,recordIDD: 1,rejoiningDate: 1,remarks1: 1,
      remarks2: 1,RequestDate: 1,Status: 1,SubmittedByUserID: 1,toDate: 1,toTime: 1,transactionNumber: 1,
      TRX_ID: 1,weekendDays: 1,WorkflowMasterID: 1 ,mobid: 1560

  );


//  });


}

initabsence_Transaction_Status(){



}

init_current_user() async {
  insering_allDB dbvar = insering_allDB();
String link  =GetLoggedinEmployee;
  link = link +="?UserId=${uid}}";

  String username = id;
  String password = pas;
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));



  Response r = await get(link,
      headers: <String, String>{'authorization': basicAuth});



  final json=JSON.jsonDecode(r.body);

  Map element = json ;





    dbvar.insert_Emp_master(
        empid:element['EmpId']  ,
        empcod:  element['EmpCod'] ,cmpidd:element['cmpidd']   ,recidd:element['Recidd']   ,empfsn: element['EmpFirstName']  ,empdoj: element['empdoj'] ,
        empact:element['empact']  ,dptidd: element['dptidd'] ,dptcod: element['dptcod']  ,dividd: element['dividd']  , divcod:element['divcod']  ,Calidd: element['Calidd']   ,
        Calcod: element['Calcod']  ,addpre: element['addpre'] , addmbn:element['addmbn']   ,empDoE:  element['empDoE'] ,empimg: element['empimg']
        ,emplsn: element['EmpLastName']  ,empmdn: element['empmdn']  ,empprn: element['empprn']  ,empsts: element['empsts']  ,loccod: element['loccod']   ,locidd: element['locidd']
        ,poscod: element['poscod'] ,posidd: element['posidd']  , Shfcod:  element['Shfcod']  ,ShfId: element['ShfId'] ,userid: element['userid']


    );



}

initemp_master() async {

  insering_allDB dbvar = insering_allDB();


  List ls = await getapi(id,pas,GetEmpList4User ,uid,"3130" );
  ls.forEach((element) {
print(element);
    element.forEach((key, value) {

    });
    dbvar.insert_Emp_master(
        empid:element['EmpId']  ,
        empcod:  element['EmpCod'] ,cmpidd:element['cmpidd']   ,recidd:element['Recidd']   ,empfsn: element['EmpFirstName']  ,empdoj: element['empdoj'] ,
        empact:element['empact']  ,dptidd: element['dptidd'] ,dptcod: element['dptcod']  ,dividd: element['dividd']  , divcod:element['divcod']  ,Calidd: element['Calidd']   ,
        Calcod: element['Calcod']  ,addpre: element['addpre'] , addmbn:element['addmbn']   ,empDoE:  element['empDoE'] ,empimg: element['empimg']
        ,emplsn: element['EmpLastName']  ,empmdn: element['empmdn']  ,empprn: element['empprn']  ,empsts: element['empsts']  ,loccod: element['loccod']   ,locidd: element['locidd']
        ,poscod: element['poscod'] ,posidd: element['posidd']  , Shfcod:  element['Shfcod']  ,ShfId: element['ShfId'] ,userid: element['userid']


    );


  });


}

initempAbsenceAssignments() async {
//TODO THERE IS A PROBLEM HERE  ADD DEFAULT VALUE FIELD
  insering_allDB dbvar = insering_allDB();


  List ls = await getapi(id,pas,GetEmployeeAbsenceAssignment ,uid,"3130" );

  ls.forEach((element) {


    dbvar.insert_EmpAbsenceAssignments(

        recidd: element['recidd'] ,cmpidd: element['cmpidd'] ,empcod: element['empcod']  ,company: element['company']
        ,empidd: element['empidd'] ,lvtcod: element['lvtcod'] ,lvtidd:element['lvtidd']  , defaultvalue: element['defaultvalue'],
      levdsc: element['levdsc']
    );


  });


}

initCalendarDetails() async {

  insering_allDB dbvar = insering_allDB();


  List ls = await getapi(id,pas,GetEmpList4User ,uid,"3130" );

  ls.forEach((element) {

//    dbvar.insert_CalendarDetails(empcod: 1 ,cmpidd: 1,company: 1,empidd: 1,lvtcod: 1,lvtidd: 1,recidd: 1);


  });


}

initabsenceTypes() async {

  insering_allDB dbvar = insering_allDB();

  List ls = await getapi(id,pas,GetVacationTypes ,uid,"3130" );

  ls.forEach((element) {
    Map s  = element;
    s.forEach((key, value) {
    });
    dbvar.insert_AbsenceTypes(
      levmaxcash: element['levmaxcash'],
      cmpidd:  element['cmpidd'],
      recidd:  element['recidd'],
      levsbo:  element['levsbo'],
      levsld:  element['levsld'],
      levtypcod:  element['levtypcod'],
      Company:  element['Company'],
      levsal:  element['levsal'],
      levfba:  element['levfrw'],
      levdsc:  element['levdsc'],
      levdft:  element['levdft'],
      levbso:  element['levbso'],
      TrvTktAll:  element['TrvTktAll'],
      levsp:  element['levsp'],
      levsol:  element['levsol'],
      levsd:  element['levsd'],
      levSalryRe:  element['levSalryRe'],
      levprv:  element['levprv'],
      LevplnAll:  element['LevplnAll'],
      levperdiem:  element['levperdiem'],
      levper:  element['levper'],
      levnjd:  element['levnjd'],
      levnew:  element['levnew'],
      levnb:   element['levnb'],
      levmabf:  element['levmabf'],
      levfrw:  element['levfrw'],
      levfrq:  element['levfrq'],
      levfbz:  element['levfbz'],
      leveos:  element['leveos'],
      levenc:  element['levenc'],
      leveddl:  element['leveddl'],
      levday:  element['levday'],
      levcol:  element['levcol'],
      levall:  element['levall'],
      levadvcash:  element['levadvcash'],
      LevadjAll:  element['LevadjAll'],
      levabz:  element['levabz'],
      IsPaidLeave:  element['IsPaidLeave'],
      AdvnSalryRe:  element['AdvnSalryRe'],



    );
  });


}

initGetEmployeeAbsenceCodeAssignment() async {

  insering_allDB dbvar = insering_allDB();

  List ls = await getapi(id,pas,GetEmployeeAbsenceCodeAssignment ,uid,"3130" );


  ls.forEach((element) {


    dbvar.insert_EmployeeAbsenceCodeAssignment(recidd:element['recidd']  ,cmpidd: element['cmpidd'],company: element['company'] ,emplevidd:
    element['emplevidd'] ,lvccod: element['lvccod']  ,lvcidd: element['lvcidd']  ,defaultvalue: element['defaultvalue'] ,lvtidd: element['ltpidd']  ,

    empcod: element['empcod'] ,
      empidd: element['empidd'],
      levdsc: element['levdsc'],

    );


  });
}

initabsenceCodes() async {

  insering_allDB dbvar = insering_allDB();


  List ls = await getapi(id,pas,GetVacationCodes ,uid,"3130" );


  ls.forEach((element) {


    dbvar.insert_AbsenceCodes(ltpidd: element['ltpidd'],levptxt: element['levptxt'],levpid:element['levpid'],levpal: element['levpal'] ,levcod: element['levcod'],recidd: element['recidd']
      ,cmpidd: element['cmpidd'],Company: element['Company'],levbso:element['levbso'] ,levdft: element['levdft'],levdsc:element['levdsc'] ,levfba:element['levfba']
      ,levsal: element['levsal'],levsbo: element['levsbo'],levsld: element['levsld'],levtypcod:element['levtypcod'] ,
    );


  });


}

initcalendarDetails() async {

  insering_allDB dbvar = insering_allDB();


  List ls = await getapi(id,pas,GetEmpList4User ,uid,"3130" );

//  ls.forEach((element) {
//
//    dbvar.insert_CalendarDetails(cmpidd:  ,recidd: ,lvtidd: ,lvtcod: ,empidd: ,company: ,empcod: ,
//
//    );
//

//  });


}

initcalendarShifts() async {

  insering_allDB dbvar = insering_allDB();


  List ls = await getapi(id,pas,GetEmpList4User ,uid,"3130" );

//  ls.forEach((element) {
//
//    dbvar.insert_CalendarShifts( recidd: , cmpidd: ,Company: ,calcod: ,caldid: ,calidd: ,callta: ,callve: ,calnss: ,calovs: ,calsid: ,calsod:
//        ,caltds: ,caltmi: ,caltmo: ,
//
//
//    );
//
//
//  });


}

initcalendarHolidays() async {

  insering_allDB dbvar = insering_allDB();


  List ls = await getapi(id,pas,GetEmpList4User ,uid,"3130" );

//  ls.forEach((element) {
//
//    dbvar.insert_CalendarHolidays(calidd:  ,calcod: ,cmpidd: ,recidd: ,calact: ,caldsc: ,calext: ,calholcod: ,calholidd: );
//
//
//  });


}

initabsenceParameters() async {

  insering_allDB dbvar = insering_allDB();


  List ls = await getapi(id,pas,GetEmpList4User ,uid,"3130" );

//  ls.forEach((element) {
//
//    dbvar.insert_AbsenceParameters(recidd: , cmpidd: ,Company: ,disFrmToTimeCtrls: ,levbcid: ,levbctxt: ,levdaysinyear4balcalid: ,levdftprltypid:
//        ,levdsy4bval: ,levdtusrdval: ,levncod: ,levprvcalunpaid: ,levpsd: ,
//    );
//
//
//  });


}

initVacationEntryType()async{
  insering_allDB dbvar = insering_allDB();

   List ls = await getapi(id,pas,GetVacationEntryType ,uid,"3130" );

  ls.forEach((element) {

    dbvar.insert_VacationEntryType(text:  element['text'] ,value:  element['value'] ,
        ValueSetID:  element['ValueSetID'] );


  });
}

intiDash() async {


  await  initGetVacationBalance4Dashboard(id,pas, );
  await  initNextScheduledAbsence4Dashboard(id,pas,empid);
  await initGetNotificationCount(id,pas,);
}

getApi_without_parameters(Username, Password ,link)async{

  String username = Username;
  String password = Password;
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  Response r = await get(link,
      headers: <String, String>{'authorization': basicAuth});

  final json=JSON.jsonDecode(r.body);


  List ls = List.from(json)  ;
if(ls.length>0)
  return ls;

else {};
}

init_timesheet() async {
  insering_allDB dbvar = insering_allDB();

  var mapres    =   await getApi_without_parameters(  id,pas , GetTimeSheetParameters) ;

  Map map = mapres.first  ;


 dbvar . insert_TimeSheetParameter(

   recidd: map['${TimeSheetParameter.recidd}'].toString(),
   btnsubtxt: map['${TimeSheetParameter.btnsubtxt}'].toString(),
   btnsubmsg: map['${TimeSheetParameter.btnsubmsg}'].toString(),
   isddlposvis: map['${TimeSheetParameter.isddlposvis}'].toString(),
   copypremvalues: map['${TimeSheetParameter.copypremvalues}'].toString(),
   copyhrtvalues: map['${TimeSheetParameter.copyhrtvalues}'].toString(),
   allowedit: map['${TimeSheetParameter.allowedit}'].toString(),
   isprthisreq: map['${TimeSheetParameter.isprthisreq}'].toString(),
   ishrthisreq: map['${TimeSheetParameter.ishrthisreq}'].toString(),
   copyNvalue: map['${TimeSheetParameter.copyNvalue}'].toString(),
   isFriOff: map['${TimeSheetParameter.isFriOff}'].toString(),
   isSatOff: map['${TimeSheetParameter.isSatOff}'].toString(),
   isSunOff: map['${TimeSheetParameter.isSunOff}'].toString(),
   ishrtprthisreq: map['${TimeSheetParameter.ishrtprthisreq}'].toString(),
   cmpidd: map['${TimeSheetParameter.cmpidd}'].toString(),
   Company: map['${TimeSheetParameter.Company}'].toString(),
   isprjtpe: map['${TimeSheetParameter.isprjtpe}'].toString(),
   isprjvis: map['${TimeSheetParameter.isprjvis}'].toString(),
   isprjdtail: map['${TimeSheetParameter.isprjdtail}'].toString(),
   isprjsbdtail: map['${TimeSheetParameter.isprjsbdtail}'].toString(),
   isindpndnt: map['${TimeSheetParameter.isindpndnt}'].toString(),
   isindpndnt2: map['${TimeSheetParameter.isindpndnt2}'].toString(),
   isprjasgnreqd: map['${TimeSheetParameter.isprjasgnreqd}'].toString(),
   isprjtpeasgnreqd: map['${TimeSheetParameter.isprjtpeasgnreqd}'].toString(),
   isprjdtlasgnreqd: map['${TimeSheetParameter.isprjdtlasgnreqd}'].toString(),
   isprjsbdtlasgnreqd: map['${TimeSheetParameter.isprjsbdtlasgnreqd}'].toString(),
   prjtypetitle: map['${TimeSheetParameter.prjtypetitle}'].toString(),
   prjtitle: map['${TimeSheetParameter.prjtitle}'].toString(),
   prjdtailtitle: map['${TimeSheetParameter.prjdtailtitle}'].toString(),
   prjsbdtailtitle: map['${TimeSheetParameter.prjsbdtailtitle}'].toString(),
   indpndnttitle: map['${TimeSheetParameter.indpndnttitle}'].toString(),
   indpndnt2title: map['${TimeSheetParameter.indpndnt2title}'].toString(),



 );


return map['${TimeSheetParameter.isprjasgnreqd}'].toString();

}

initemp_master_Timesheet() async {

  insering_allDB dbvar = insering_allDB();


  List ls = await getapi(id,pas,GetEmpList4User ,uid,"3169" );


  ls.forEach((element) {



    dbvar.insert_Emp_master_timesheet(
        empid:element['EmpId']  ,
        empcod:  element['EmpCod'] ,cmpidd:element['cmpidd']   ,recidd:element['Recidd']   ,empfsn: element['EmpFirstName']  ,empdoj: element['empdoj'] ,
        empact:element['empact']  ,dptidd: element['dptidd'] ,dptcod: element['dptcod']  ,dividd: element['dividd']  , divcod:element['divcod']  ,Calidd: element['Calidd']   ,
        Calcod: element['Calcod']  ,addpre: element['addpre'] , addmbn:element['addmbn']   ,empDoE:  element['empDoE'] ,empimg: element['empimg']
        ,emplsn: element['EmpLastName']  ,empmdn: element['empmdn']  ,empprn: element['empprn']  ,empsts: element['empsts']  ,loccod: element['loccod']   ,locidd: element['locidd']
        ,poscod: element['poscod'] ,posidd: element['posidd']  , Shfcod:  element['Shfcod']  ,ShfId: element['ShfId'] ,userid: element['userid']
    );


  });


}

init_ProjectD1(String isprjasgnreqd) async {
  insering_allDB dbvar = insering_allDB();


  String  url  ;
  if(isprjasgnreqd.compareTo('1')==1){
 url =    GetPrjD1 +empid ;




  }
  else{

    url = GetPrjD1WithoutAsgn;
  }



  List ls =   await getApi_without_parameters(  id,pas , url) ;

  ls.forEach((element) {

    dbvar. insert_ProjectD1(

      empidd: element['${ProjectD1.empidd}'].toString(),
      empcod: element['${ProjectD1.empcod}'].toString(),
      empfsn: element['${ProjectD1.empfsn}'].toString(),
      prjtypidd: element['${ProjectD1.prjtypidd}'].toString(),
      prjtypcod: element['${ProjectD1.prjtypcod}'].toString(),
      description: element['${ProjectD1.description}'].toString(),


    );

  });











}

init_ProjectD2(String isprjasgnreqd) async {
  insering_allDB dbvar = insering_allDB();

  String url;

  if(isprjasgnreqd.compareTo('1')==1){
    url = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjDD2?EmpId=$empid';

  }
  else{
    url = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjD1NonAssignment';
  }

  List ls =   await getApi_without_parameters(  id,pas , url) ;

  ls.forEach((element) {



    dbvar. insert_ProjectD2(

        prjidd: element['${ProjectD2.prjidd}'].toString(),
        prjcod: element['${ProjectD2.prjcod}'].toString(),
        empidd: element['${ProjectD2.empidd}'].toString(),
        empcod: element['${ProjectD2.empcod}'].toString(),
        empfsn: element['${ProjectD2.empfsn}'].toString(),
        prjtypidd: element['${ProjectD2.prjtypidd}'].toString(),
        prjtypcod: element['${ProjectD2.prjtypcod}'].toString(),
        prjds1: element['${ProjectD2.prjds1}'].toString()



    );


  });


}

init_ProjectD3(String isprjasgnreqd) async {
  insering_allDB dbvar = insering_allDB();

  String url;

  if(isprjasgnreqd.compareTo('1')==1){
    url = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjDD3?EmpId=$empid&PrjTypId=1&PrjId=6';

  }
  else{
    url = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjD3NonAssignment?PrjId=24';
  }

  List ls =   await getApi_without_parameters(  id,pas , url) ;

  ls.forEach((element) {



    dbvar. insert_ProjectD3(

      prjidd: element['${ProjectD3.prjidd}'].toString(),
      prjcod: element['${ProjectD3.prjcod}'].toString(),
      empidd: element['${ProjectD3.empidd}'].toString(),
      empcod: element['${ProjectD3.empcod}'].toString(),
      empfsn: element['${ProjectD3.empfsn}'].toString(),
      prjtypidd: element['${ProjectD3.prjtypidd}'].toString(),
      prjtypcod: element['${ProjectD3.prjtypcod}'].toString(),
      prjdtlidd: element['${ProjectD3.prjdtlidd}'].toString(),
      prjdtlcod: element['${ProjectD3.prjdtlcod}'].toString(),
      description: element['${ProjectD3.description}'].toString(),




    );


  });


}

init_ProjectD4(String isprjasgnreqd) async {
  insering_allDB dbvar = insering_allDB();

  String url;

  if(isprjasgnreqd.compareTo('1')==1){
    url = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjDD4?EmpId=563&PrjTypId=1&PrjId=6&PrjDtlId=23';

  }
  else{
    url = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjD4NonAssignment?PrjDtlId=24';
  }

  List ls =   await getApi_without_parameters(  id,pas , url) ;

  ls.forEach((element) {



    dbvar. insert_ProjectD4(
      prjidd: element['${ProjectD4.prjidd}'].toString(),
      prjcod: element['${ProjectD4.prjcod}'].toString(),
      empidd: element['${ProjectD4.empidd}'].toString(),
      empcod: element['${ProjectD4.empcod}'].toString(),
      empfsn: element['${ProjectD4.empfsn}'].toString(),
      prjtypidd: element['${ProjectD4.prjtypidd}'].toString(),
      prjtypcod: element['${ProjectD4.prjtypcod}'].toString(),
      prjdtlidd: element['${ProjectD4.prjdtlidd}'].toString(),
      prjdtlcod: element['${ProjectD4.prjdtlcod}'].toString(),
      prjsubdtlidd: element['${ProjectD4.prjsubdtlidd}'].toString(),
      prjsubdtlcod: element['${ProjectD4.prjsubdtlcod}'].toString(),
      description: element['${ProjectD4.description}'].toString(),
    );


  });


}

init_insert_independent_dropDown_1() async {
  insering_allDB dbvar = insering_allDB();

  String url = 'http://smemobapi.azurewebsites.net/api/Project/GetIndProject?Type=1';
  List ls =   await getApi_without_parameters(  id,pas , url) ;

  ls.forEach((element) {



    dbvar. insert_independent_dropDown_1(
      idd: element['${Independent_dropDown_1.idd}'].toString(),
      code: element['${Independent_dropDown_1.code}'].toString(),
      description: element['${Independent_dropDown_1.description}'].toString(),
      ddlType: element['${Independent_dropDown_1.ddlType}'].toString(),

    );


  });
}

init_insert_independent_dropDown_2() async {
  insering_allDB dbvar = insering_allDB();

  String url = 'http://smemobapi.azurewebsites.net/api/Project/GetIndProject?Type=2';
  List ls =   await getApi_without_parameters(  id,pas , url) ;

  ls.forEach((element) {



    dbvar. insert_independent_dropDown_2(
      idd: element['${Independent_dropDown_2.idd}'].toString(),
      code: element['${Independent_dropDown_2.code}'].toString(),
      description: element['${Independent_dropDown_2.description}'].toString(),
      ddlType: element['${Independent_dropDown_2.ddlType}'].toString(),

    );


  });
}

init_insert_Premium_type() async {


  insering_allDB dbvar = insering_allDB();

  String url = 'http://smemobapi.azurewebsites.net/api/PremiumType/GetAllPrmTypes';


  List ls =   await getApi_without_parameters(  id,pas , url) ;

  ls.forEach((key) {


  });
  ls.forEach((element) {

    dbvar  . insering_premium_type_db(

      recidd: element['${Premium_type_db.recidd}'].toString(),
      premtype: element['${Premium_type_db.premtype}'].toString(),
      premtypedescription: element['${Premium_type_db.premtypedescription}'].toString(),
      uopidd: element['${Premium_type_db.uopidd}'].toString(),
      uopcod: element['${Premium_type_db.uopcod}'].toString(),
      type: element['${Premium_type_db.type}'].toString(),
      cmpidd: element['${Premium_type_db.cmpidd}'].toString(),
      Company: element['${Premium_type_db.Company}'].toString(),
      typecod: element['${Premium_type_db.typecod}'].toString(),

    );

  });
}

init_insert_Hour_type( ) async {


  insering_allDB dbvar = insering_allDB();

  String url = 'http://smemobapi.azurewebsites.net/api/EmpHourType/GetHrTyps?EmpID=563';



  List ls =   await getApi_without_parameters(  id,pas , url) ;


  ls.forEach((element) {

    dbvar  . insering_hour_type_db(
        recidd: element['${HourTypes.recidd}'].toString(),
        hrtidd: element['${HourTypes.hrtidd}'].toString(),
        empidd: element['${HourTypes.empidd}'].toString(),
        empcod: element['${HourTypes.empcod}'].toString(),
        empfsn: element['${HourTypes.empfsn}'].toString(),
        hourtypecode: element['${HourTypes.hourtypecode}'].toString(),
        hourtypedescription: element['${HourTypes.hourtypedescription}'].toString(),
        hourtypedescription2: element['${HourTypes.hourtypedescription2}'].toString(),
        specval: element['${HourTypes.specval}'].toString(),
        fromval: element['${HourTypes.fromval}'].toString(),
        toval: element['${HourTypes.toval}'].toString(),
        defval: element['${HourTypes.defval}'].toString(),
        cmpidd: element['${HourTypes.cmpidd}'].toString(),
        Company: element['${HourTypes.Company}'].toString()


    );









  });
}

init_Absence_Transaction( ) async {


  insering_allDB dbvar = insering_allDB();
  final absence_Transaction= Absence_Transaction.instance;



  List ls =   await getApi_without_parameters(  id,pas , GetAbsenceTransactions4User+uid) ;


  ls.forEach((ls) async {
    Map <String,dynamic>d = {

      "${Absence_Transaction.recordIDD}": ls['RecordIDD'],
      "${Absence_Transaction.rejoiningDate}": ls['RejoiningDate'],
      "${Absence_Transaction
          .transactionNumber}": ls['TransactionNumber'],
      "${Absence_Transaction.LeaveCode}": ls['LeaveCode'],
      "${Absence_Transaction.leaveTypeCode}": ls['LeaveTypeCode'],
      "${Absence_Transaction.calendarDays}": ls['CalendarDays'],
      "${Absence_Transaction.weekendDays}": ls['WeekendDays'],
      "${Absence_Transaction.holidays}": ls['Holidays'],

      "${Absence_Transaction.EmployeeUserID}":
      ls['employeeUserID'],

      "${Absence_Transaction.Status}": ls['Status'],
      "${Absence_Transaction.NumberOfDays}": ls['NumberOfDays'],



      "${Absence_Transaction.syncstatus}": 1,
      "${Absence_Transaction.syncdate}": DateTime
          .now()
          .millisecondsSinceEpoch,
      "${Absence_Transaction.operation}": 'Downloaded',

      "${Absence_Transaction.airTicket}": ls['AirTicket'],
      "${Absence_Transaction.cashAmount}": ls['CashAmount'],

      "${Absence_Transaction.Company}": ls['Company'],
      "${Absence_Transaction.dayPercentage}": ls['DayPercentage'],
      "${Absence_Transaction.employeeIDD}": ls['EmployeeIDD'],
      "${Absence_Transaction.entryType}": ls['EntryType'],
      "${Absence_Transaction.fromDate}": ls['FromDate'],

      "${Absence_Transaction.fromTime}": ls['FromTime'],
      "${Absence_Transaction.hourly}": ls['Hourly'],
      "${Absence_Transaction.LeaveCodeIDD}": ls['LeaveCodeIDD'],
      "${Absence_Transaction.leaveSalary}": ls['LeaveSalary'],


      "${Absence_Transaction.leaveTypeIDD}": ls['LeaveTypeIDD'],
      "${Absence_Transaction.leavedays}": ls['Leavedays'],
      "${Absence_Transaction.cashCheck}": ls['Levadvcash'],
      //TODO IGNORED
    //  "${Absence_Transaction.cashAmount}": 'Levmaxcash',  
//TODO  IGNORED
//      "${Absence_Transaction.leaveSalary}": 'Levsal',
      "${Absence_Transaction.offHours}": ls['OffHours'],
      "${Absence_Transaction.OffMints}": ls['OffMints'],
      "${Absence_Transaction.perDiem}": ls['PerDiem'],
      "${Absence_Transaction.remarks1}": ls['Remarks1'],
      "${Absence_Transaction.remarks2}": ls['Remarks2'],
      "${Absence_Transaction.RequestDate}": ls['Requestdate'],
      "${Absence_Transaction.SubmittedByUserID}": ls['SubmittedByUserID'],
      "${Absence_Transaction.TRX_ID}": ls['TRX_ID'],
      "${Absence_Transaction.toDate}": ls['ToDate'],
      "${Absence_Transaction.toTime}": ls['ToTime'],
      "${Absence_Transaction.TransRemarks}": ls['TransRemarks'],
      "${Absence_Transaction.WorkflowMasterID}": ls['WorkflowMasterID'],
      "${Absence_Transaction.cmpidd}": ls['cmpidd'],
      "${Absence_Transaction.mobid}": ls['mobid'],


      "${Absence_Transaction.calendarIDD}": ls['calendarIDD'],
      "${Absence_Transaction.calendarCode}": ls['calendarCode'],
      "${Absence_Transaction.entryDate}": ls['entryDate'],
      "${Absence_Transaction.employeeCode}": ls['employeeCode'],


      "${Absence_Transaction.name}": ls[Absence_Transaction.name],
      "${Absence_Transaction.leavedesc}": ls[Absence_Transaction.leavedesc],
      "${Absence_Transaction.leavetypedesc}": ls[Absence_Transaction.leavetypedesc],
      "${Absence_Transaction.entrydesc}": ls[Absence_Transaction.entrydesc],



    };

    int res = await absence_Transaction.insert(d);

  });
}

init_insert_Eb_prllevtrx_status( ) async {


  insering_allDB dbvar = insering_allDB();



  List ls =   await getApi_without_parameters(  id,pas , GetAbsenceTransactionStatus4User+uid) ;


  ls.forEach((element) {




    dbvar.insert_Eb_prllevtrx_status(
        syncstatus: 1,
        operation: 'Downloaded',
        syncdate: DateTime
            .now()
            .millisecondsSinceEpoch,
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
        WorkflowID: element['WorkflowID'] ,
        ApprovedByUserIDName: element[Eb_prllevtrx_status.ApprovedByUserIDName],
        MainApproverUserIDName:element[Eb_prllevtrx_status.MainApproverUserIDName]



    );

});}

