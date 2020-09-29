import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/NotificationCount.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/ScheduledAbsence.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/VacationBalance.dart';
import 'package:sm_service/Database_Files/Local_DB/Menu.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/EmpMaster_timesheet.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD3.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD4.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/HourType/Hour_Type.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Position.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/PremiumType/PremiumType_db.dart';
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
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/TimeSheetParameter.dart';

import 'Local_DB/Time_sheet/Get_project_dropdown/ProjectD1.dart';
import 'Local_DB/Time_sheet/Get_project_dropdown/ProjectD2.dart';
import 'Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_1.dart';
import 'Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_2.dart';



class insering_allDB {
  final emp_master = EmpMaster.instance;
  final empAbsenceAssignments = EmpAbsenceAssignments.instance;
  final absenceTypes = AbsenceTypes.instance;
  final absenceCodes = AbsenceCodes.instance;
  final calendarDetails = CalendarDetails.instance;
  final calendarShifts = CalendarShifts.instance;
  final calendarHolidays = CalendarHolidays.instance;
  final absenceParameters = AbsenceParameters.instance;
  final vacationEntryType = VacationEntryType.instance;
  final employeeAbsenceCodeAssignment = EmployeeAbsenceCodeAssignment.instance;
  final absence_Transaction = Absence_Transaction.instance;
  final eb_prllevtrx_status =Eb_prllevtrx_status.instance;
  final menu  = Menu.instance;


  final scheduledAbsence = ScheduledAbsence.instance;
  final vacationBalance = VacationBalance.instance;
  final notificationCount = NotificationCount.instance;
  final timesheetparameter = TimeSheetParameter.instance;
    final emp_master_timesheet = EmpMaster_Timesheet.instance;
  final getPrjD1 = ProjectD1.instance;
  final getPrjD2 = ProjectD2.instance;
  final getPrjD3 = ProjectD3.instance;
  final getPrjD4 = ProjectD4.instance;
  Independent_dropDown_1 independent_dropDown_1= Independent_dropDown_1.instance ;
  Independent_dropDown_2 independent_dropDown_2= Independent_dropDown_2.instance ;

  Premium_type_db premium_type_db = Premium_type_db.instance;
  HourTypes hourTypes = HourTypes.instance;


  insering_hour_type_db({
    recidd,	hrtidd,	empidd,	empcod,	empfsn,	hourtypecode,	hourtypedescription,	hourtypedescription2,	specval,	fromval,	toval,	defval,	cmpidd,	Company


}) async {
    Map<String, dynamic> row = {

      HourTypes.recidd: recidd,
      HourTypes.hrtidd: hrtidd,
      HourTypes.empidd: empidd,
      HourTypes.empcod: empcod,
      HourTypes.empfsn: empfsn,
      HourTypes.hourtypecode: hourtypecode,
      HourTypes.hourtypedescription: hourtypedescription,
      HourTypes.hourtypedescription2: hourtypedescription2,
      HourTypes.specval: specval,
      HourTypes.fromval: fromval,
      HourTypes.toval: toval,
      HourTypes.defval: defval,
      HourTypes.cmpidd: cmpidd,
      HourTypes.Company: Company



    };
    final id = await hourTypes.insert(row);


}
insering_premium_type_db({


  recidd,	premtype, premtypedescription, uopidd,uopcod,type,cmpidd,Company,	typecod,

}) async {

  Map<String, dynamic> row = {
    Premium_type_db.recidd: recidd,
    Premium_type_db.premtype: premtype,
    Premium_type_db.premtypedescription: premtypedescription,
    Premium_type_db.uopidd: uopidd,
    Premium_type_db.uopcod: uopcod,
    Premium_type_db.type: type,
    Premium_type_db.cmpidd: cmpidd,
    Premium_type_db.Company: Company,
    Premium_type_db.typecod: typecod,


  };
  final id = await premium_type_db.insert(row);


}



  insert_Emp_master_timesheet({
    recidd,
    empcod,
    empfsn,
    empmdn,
    emplsn,
    empprn,
    dptidd,
    dptcod,
    posidd,
    poscod,
    dividd,
    divcod,
    empsts,
    locidd,
    loccod,
    empdoj,
    addmbn,
    addpre,
    empact,
    Calidd,
    Calcod,
    Shfcod,
    cmpidd,
    empimg,
    empDoE,
    ShfId,
    userid,
    empid
  }) async {
    Map<String, dynamic> row = {
      EmpMaster_Timesheet.recidd: recidd,
      EmpMaster_Timesheet.empcod: empcod,
      EmpMaster_Timesheet.empid: empid,

      EmpMaster_Timesheet.empfsn: empfsn,
      EmpMaster_Timesheet.empmdn: empmdn,
      EmpMaster_Timesheet.emplsn: emplsn,
      EmpMaster_Timesheet.empprn: empprn,
      EmpMaster_Timesheet.dptidd: dptidd,
      EmpMaster_Timesheet.dptcod: dptcod,
      EmpMaster_Timesheet.posidd: posidd,
      EmpMaster_Timesheet.poscod: poscod,
      EmpMaster_Timesheet.dividd: dividd,
      EmpMaster_Timesheet.divcod: divcod,
      EmpMaster_Timesheet.empsts: empsts,
      EmpMaster_Timesheet.locidd: locidd,
      EmpMaster_Timesheet.loccod: loccod,
      EmpMaster_Timesheet.empdoj: empdoj,
      EmpMaster_Timesheet.addmbn: addmbn,
      EmpMaster_Timesheet.addpre: addpre,
      EmpMaster_Timesheet.empact: empact,
      EmpMaster_Timesheet.Calidd: Calidd,
      EmpMaster_Timesheet.Calcod: Calcod,
      EmpMaster_Timesheet.Shfcod: Shfcod,
      EmpMaster_Timesheet.cmpidd: cmpidd,
      EmpMaster_Timesheet.empimg: empimg,
      EmpMaster_Timesheet.empDoE: empDoE,
      EmpMaster_Timesheet.ShfId: ShfId,
      EmpMaster_Timesheet.userid: userid,

    };
    final id = await emp_master_timesheet.insert(row);

  }

  insert_independent_dropDown_2({

    idd,	code,	description,	ddlType

  }) async {


    Map<String, dynamic> row = {
      Independent_dropDown_2.idd: idd,
      Independent_dropDown_2.code: code,
      Independent_dropDown_2.description: description,
      Independent_dropDown_2.ddlType: ddlType,

    };


    final id = await independent_dropDown_2.insert(row);

  }



  insert_independent_dropDown_1({

  	idd,	code,	description,	ddlType

}) async {


  Map<String, dynamic> row = {
    Independent_dropDown_1.idd: idd,
    Independent_dropDown_1.code: code,
    Independent_dropDown_1.description: description,
    Independent_dropDown_1.ddlType: ddlType,

  };


  final id = await independent_dropDown_1.insert(row);

}


  insert_ProjectD4({

    prjidd,	prjcod,	empidd,	empcod,	empfsn,	prjtypidd,	prjtypcod,	prjdtlidd,	prjdtlcod,	prjsubdtlidd,	prjsubdtlcod,	description
}) async {

    Map<String, dynamic> row = {
      ProjectD4.prjidd: prjidd,
      ProjectD4.prjcod: prjcod,
      ProjectD4.empidd: empidd,
      ProjectD4.empcod: empcod,
      ProjectD4.empfsn: empfsn,
      ProjectD4.prjtypidd: prjtypidd,
      ProjectD4.prjtypcod: prjtypcod,
      ProjectD4.prjdtlidd: prjdtlidd,
      ProjectD4.prjdtlcod: prjdtlcod,
      ProjectD4.prjsubdtlidd: prjsubdtlidd,
      ProjectD4.prjsubdtlcod: prjsubdtlcod,
      ProjectD4.description: description,




    };


    final id = await getPrjD4.insert(row);

  }
  insert_ProjectD3({
    prjidd,	prjcod,	empidd,	empcod,	empfsn,	prjtypidd,	prjtypcod,	prjdtlidd,	prjdtlcod,	description

  }) async {


    Map<String, dynamic> row = {
      ProjectD3.prjidd: prjidd,
      ProjectD3.prjcod: prjcod,
      ProjectD3.empidd: empidd,
      ProjectD3.empcod: empcod,
      ProjectD3.empfsn: empfsn,
      ProjectD3.prjtypidd: prjtypidd,
      ProjectD3.prjtypcod: prjtypcod,
      ProjectD3.prjdtlidd: prjdtlidd,
      ProjectD3.prjdtlcod: prjdtlcod,
      ProjectD3.description: description,



    };


    final id = await getPrjD3.insert(row);


  }


  insert_ProjectD2({
    prjidd,	prjcod,	empidd,	empcod,	empfsn,	prjtypidd,	prjtypcod,	prjds1



  }) async {


    Map<String, dynamic> row = {
      ProjectD2.prjidd: prjidd,
      ProjectD2.prjcod: prjcod,
      ProjectD2.empidd: empidd,
      ProjectD2.empcod: empcod,
      ProjectD2.empfsn: empfsn,
      ProjectD2.prjtypidd: prjtypidd,
      ProjectD2.prjtypcod: prjtypcod,
      ProjectD2.prjds1: prjds1,


    };


    final id = await getPrjD2.insert(row);


  }


  insert_ProjectD1({

  empidd,	empcod,	empfsn,	prjtypidd,	prjtypcod,
  description,


}) async {


  Map<String, dynamic> row = {
    ProjectD1.empidd: empidd,
    ProjectD1.empcod: empcod,
    ProjectD1.empfsn: empfsn,
    ProjectD1.prjtypidd: prjtypidd,
    ProjectD1.prjtypcod: prjtypcod,
    ProjectD1.description: description,

  };


  final id = await getPrjD1.insert(row);


}
  insert_TimeSheetParameter({

    recidd,	btnsubtxt,	btnsubmsg,	isddlposvis,	copypremvalues,	copyhrtvalues,	allowedit,	isprthisreq,	ishrthisreq,	copyNvalue,	isFriOff,	isSatOff,	isSunOff,	ishrtprthisreq,	cmpidd,	Company,	isprjtpe,	isprjvis,	isprjdtail,	isprjsbdtail,	isindpndnt,	isindpndnt2,	isprjasgnreqd,	isprjtpeasgnreqd,	isprjdtlasgnreqd,	isprjsbdtlasgnreqd,	prjtypetitle,	prjtitle,	prjdtailtitle,	prjsbdtailtitle,	indpndnttitle,	indpndnt2title,

}) async {

Map<String, dynamic> row = {



  TimeSheetParameter.recidd: recidd,
  TimeSheetParameter.btnsubtxt: btnsubtxt,
  TimeSheetParameter.btnsubmsg: btnsubmsg,
  TimeSheetParameter.isddlposvis: isddlposvis,
  TimeSheetParameter.copypremvalues: copypremvalues,
  TimeSheetParameter.copyhrtvalues: copyhrtvalues,
  TimeSheetParameter.allowedit: allowedit,
  TimeSheetParameter.isprthisreq: isprthisreq,
  TimeSheetParameter.ishrthisreq: ishrthisreq,
  TimeSheetParameter.copyNvalue: copyNvalue,
  TimeSheetParameter.isFriOff: isFriOff,
  TimeSheetParameter.isSatOff: isSatOff,
  TimeSheetParameter.isSunOff: isSunOff,
  TimeSheetParameter.ishrtprthisreq: ishrtprthisreq,
  TimeSheetParameter.cmpidd: cmpidd,
  TimeSheetParameter.Company: Company,
  TimeSheetParameter.isprjtpe: isprjtpe,
  TimeSheetParameter.isprjvis: isprjvis,
  TimeSheetParameter.isprjdtail: isprjdtail,
  TimeSheetParameter.isprjsbdtail: isprjsbdtail,
  TimeSheetParameter.isindpndnt: isindpndnt,
  TimeSheetParameter.isindpndnt2: isindpndnt2,
  TimeSheetParameter.isprjasgnreqd: isprjasgnreqd,
  TimeSheetParameter.isprjtpeasgnreqd: isprjtpeasgnreqd,
  TimeSheetParameter.isprjdtlasgnreqd: isprjdtlasgnreqd,
  TimeSheetParameter.isprjsbdtlasgnreqd: isprjsbdtlasgnreqd,
  TimeSheetParameter.prjtypetitle: prjtypetitle,
  TimeSheetParameter.prjtitle: prjtitle,
  TimeSheetParameter.prjdtailtitle: prjdtailtitle,
  TimeSheetParameter.prjsbdtailtitle: prjsbdtailtitle,
  TimeSheetParameter.indpndnttitle: indpndnttitle,
  TimeSheetParameter.indpndnt2title: indpndnt2title,


};

final id = await timesheetparameter.insert(row);

}

  insert_notificationCount({

    notificationCountvar

  }) async {

    Map<String, dynamic> row = {
      NotificationCount.notificationCount: notificationCountvar,


    };

    final id = await notificationCount.insert(row);

  }

  insert_vacationBalance({

    LeaveCode,
    EmployeeCode,
    LeaveType,
    Balance,

  }) async {

    Map<String, dynamic> row = {
      VacationBalance.LeaveCode: LeaveCode,
      VacationBalance.EmployeeCode: EmployeeCode,
      VacationBalance.LeaveType: LeaveType,
      VacationBalance.Balance: Balance,

    };

    final id = await vacationBalance.insert(row);

  }


  insert_scheduledAbsence({

    ToDate,
    FromDate,
    EmployeeCode,
    LeaveCode,
    FromTime,
    ToTime,
    Hourly
  }) async {

    Map<String, dynamic> row = {
      ScheduledAbsence.ToDate: ToDate,
      ScheduledAbsence.FromDate: FromDate,
      ScheduledAbsence.EmployeeCode: EmployeeCode,
      ScheduledAbsence.LeaveCode: LeaveCode,
      ScheduledAbsence.FromTime: FromTime,
      ScheduledAbsence.ToTime : ToTime,
      ScheduledAbsence.Hourly: Hourly,


    };

    final id = await scheduledAbsence.insert(row);

  }

  insert_Menue({

    description,
    ID,
    subMenu,
    SubMod,
    Url,
    name

  }) async {

    Map<String, dynamic> row = {
      Menu.Description: description,
      Menu.ID: ID,
      Menu.SubMenu: subMenu,
      Menu.SubMod: SubMod,
      Menu.Url: Url,
      Menu.name: name,


    };
    await menu.deleteall();
    final id = await menu.insert(row);


  }

  insert_Emp_master({
    recidd,
    empcod,
    empfsn,
    empmdn,
    emplsn,
    empprn,
    dptidd,
    dptcod,
    posidd,
    poscod,
    dividd,
    divcod,
    empsts,
    locidd,
    loccod,
    empdoj,
    addmbn,
    addpre,
    empact,
    Calidd,
    Calcod,
    Shfcod,
    cmpidd,
    empimg,
    empDoE,
    ShfId,
    userid,
    empid
  }) async {
    Map<String, dynamic> row = {
      EmpMaster.recidd: recidd,
      EmpMaster.empcod: empcod,
      EmpMaster.empid: empid,


      EmpMaster.empfsn: empfsn,
      EmpMaster.empmdn: empmdn,
      EmpMaster.emplsn: emplsn,
      EmpMaster.empprn: empprn,
      EmpMaster.dptidd: dptidd,
      EmpMaster.dptcod: dptcod,
      EmpMaster.posidd: posidd,
      EmpMaster.poscod: poscod,
      EmpMaster.dividd: dividd,
      EmpMaster.divcod: divcod,
      EmpMaster.empsts: empsts,
      EmpMaster.locidd: locidd,
      EmpMaster.loccod: loccod,
      EmpMaster.empdoj: empdoj,
      EmpMaster.addmbn: addmbn,
      EmpMaster.addpre: addpre,
      EmpMaster.empact: empact,
      EmpMaster.Calidd: Calidd,
      EmpMaster.Calcod: Calcod,
      EmpMaster.Shfcod: Shfcod,
      EmpMaster.cmpidd: cmpidd,
      EmpMaster.empimg: empimg,
      EmpMaster.empDoE: empDoE,
      EmpMaster.ShfId: ShfId,
      EmpMaster.userid: userid,

    };
    final id = await emp_master.insert(row);

  }

  insert_AbsenceTypes(
      {recidd,
        levtypcod,
        levdft,
        levdsc,
        levsld,
        levbso,
        levsbo,
        levfba,
        levsal,
        levfrw,
        levenc,
        levprv,
        levfrq,
        levday,
        levall,
        levnew,
        levper,
        levcol,
        leveos,
        levmabf,
        levabz,
        levnjd,
        levnb,
        levsd,
        levsp,
        levsol,
        leveddl,
        levfbz,
        cmpidd,
        Company,
        levperdiem,
        levadvcash,
        levmaxcash,
        TrvTktAll,
        LevplnAll,
        AdvnSalryRe,
        levSalryRe,
        IsPaidLeave,
        LevadjAll}) async {
    Map<String, dynamic> row = {
//      DatabaseHelper.columnName : 'Bob',
//      DatabaseHelper.columnAge  : 23,

//TODO BACKUP BEFORE API TESTING
      AbsenceTypes.recidd: recidd,
      AbsenceTypes.levtypcod: levtypcod,
      AbsenceTypes.levdft: levdft,
      AbsenceTypes.levdsc: levdsc,
      AbsenceTypes.levsld: levsld,
      AbsenceTypes.levbso: levbso,
      AbsenceTypes.levsbo: levsbo,
      AbsenceTypes.levfba: levfba,
      AbsenceTypes.levsal: levsal,
      AbsenceTypes.levfrw: levfrw,
      AbsenceTypes.levenc: levenc,
      AbsenceTypes.levprv: levprv,
      AbsenceTypes.levfrq: levfrq,
      AbsenceTypes.levday: levday,
      AbsenceTypes.levall: levall,
      AbsenceTypes.levnew: levnew,
      AbsenceTypes.levper: levper,
      AbsenceTypes.levcol: levcol,
      AbsenceTypes.leveos: leveos,
      AbsenceTypes.levmabf: levmabf,
      AbsenceTypes.levabz: levabz,
      AbsenceTypes.levnjd: levnjd,
      AbsenceTypes.levnb: levnb,
      AbsenceTypes.levsd: levsd,
      AbsenceTypes.levsp: levsp,
      AbsenceTypes.levsol: levsol,
      AbsenceTypes.leveddl: leveddl,
      AbsenceTypes.levfbz: levfbz,
      AbsenceTypes.cmpidd: cmpidd,
      AbsenceTypes.Company: Company,
      AbsenceTypes.levperdiem: levperdiem,
      AbsenceTypes.levadvcash: levadvcash,
      AbsenceTypes.levmaxcash: levmaxcash,
      AbsenceTypes.TrvTktAll: TrvTktAll,
      AbsenceTypes.LevplnAll: LevplnAll,
      AbsenceTypes.AdvnSalryRe: AdvnSalryRe,
      AbsenceTypes.levSalryRe: levSalryRe,
      AbsenceTypes.IsPaidLeave: IsPaidLeave,
      AbsenceTypes.LevadjAll: LevadjAll
    };
    final id = await absenceTypes.insert(row);

  }

  insert_AbsenceCodes(
      {recidd,
        ltpidd,
        levtypcod,
        levdft,
        levcod,
        levdsc,
        levsld,
        levbso,
        levsbo,
        levfba,
        levsal,
        levpid,
        levptxt,
        levpal,
        cmpidd,
        Company}) async {
    Map<String, dynamic> row = {
      AbsenceCodes.recidd: recidd,
      AbsenceCodes.ltpidd: ltpidd,
      AbsenceCodes.levtypcod: levtypcod,
      AbsenceCodes.levdft: levdft,
      AbsenceCodes.levcod: levcod,
      AbsenceCodes.levdsc: levdsc,
      AbsenceCodes.levsld: levsld,
      AbsenceCodes.levbso: levbso,
      AbsenceCodes.levsbo: levsbo,
      AbsenceCodes.levfba: levfba,
      AbsenceCodes.levsal: levsal,
      AbsenceCodes.levpid: levpid,
      AbsenceCodes.levptxt: levptxt,
      AbsenceCodes.levpal: levpal,
      AbsenceCodes.cmpidd: cmpidd,
      AbsenceCodes.Company: Company,
    };
    final id = await absenceCodes.insert(row);

  }


  insert_EmpAbsenceAssignments(
      {recidd, empidd, empcod, lvtidd, lvtcod, cmpidd, company  , defaultvalue}) async {
    Map<String, dynamic> row = {
//      DatabaseHelper.columnName : 'Bob',
//      DatabaseHelper.columnAge  : 23,

//TODO BACKUP BEFORE API TESTING

      EmpAbsenceAssignments.recidd: recidd,
      EmpAbsenceAssignments.empidd: empidd,
      EmpAbsenceAssignments.empcod: empcod,
      EmpAbsenceAssignments.lvtidd: lvtidd,
      EmpAbsenceAssignments.lvtcod: lvtcod,
      EmpAbsenceAssignments.cmpidd: cmpidd,
      EmpAbsenceAssignments.Company: company,
      EmpAbsenceAssignments.defaultvalue: defaultvalue,

    };
    final id = await empAbsenceAssignments.insert(row);
  }

  insert_CalendarShifts(
      {recidd,
        calidd,
        calcod,
        calsid,
        calsod,
        caldid,
        caltds,
        caltmi,
        caltmo,
        callta,
        callve,
        calovs,
        calnss,
        cmpidd,
        Company}) async {
    Map<String, dynamic> row = {
//      DatabaseHelper.columnName : 'Bob',
//      DatabaseHelper.columnAge  : 23,

//TODO BACKUP BEFORE API TESTING

      CalendarShifts.recidd: recidd,
      CalendarShifts.calidd: calidd,
      CalendarShifts.calcod: calcod,
      CalendarShifts.calsid: calsid,
      CalendarShifts.calsod: calsod,
      CalendarShifts.caldid: caldid,
      CalendarShifts.caltds: caltds,
      CalendarShifts.caltmi: caltmi,
      CalendarShifts.caltmo: caltmo,
      CalendarShifts.callta: callta,
      CalendarShifts.callve: callve,
      CalendarShifts.calovs: calovs,
      CalendarShifts.calnss: calnss,
      CalendarShifts.cmpidd: cmpidd,
      CalendarShifts.Company: Company
    };
    final id = await calendarShifts.insert(row);
  }

  insert_CalendarHolidays({
    recidd,
    calidd,
    calcod,
    calext,
    calact,
    calholidd,
    calholcod,
    caldsc,
    cmpidd,
  }) async {
    Map<String, dynamic> row = {
//      DatabaseHelper.columnName : 'Bob',
//      DatabaseHelper.columnAge  : 23,

//TODO BACKUP BEFORE API TESTING

      CalendarHolidays.recidd: recidd,
      CalendarHolidays.calidd: calidd,
      CalendarHolidays.calcod: calcod,
      CalendarHolidays.calext: calext,
      CalendarHolidays.calact: calact,
      CalendarHolidays.calholidd: calholidd,
      CalendarHolidays.calholcod: calholcod,
      CalendarHolidays.caldsc: caldsc,
      CalendarHolidays.cmpidd: cmpidd
    };
    final id = await calendarHolidays.insert(row);

  }

  insert_AbsenceParameters({
    recidd,
    levbcid,
    levbctxt,
    levpsd,
    levncod,
    levdftprltypid,
    levdaysinyear4balcalid,
    levprvcalunpaid,
    levdtusrdval,
    levdsy4bval,
    disFrmToTimeCtrls,
    cmpidd,
    Company,
  }) async {
    Map<String, dynamic> row = {
//      DatabaseHelper.columnName : 'Bob',
//      DatabaseHelper.columnAge  : 23,

//TODO BACKUP BEFORE API TESTING

      AbsenceParameters.recidd: recidd,
      AbsenceParameters.levbcid: levbcid,
      AbsenceParameters.levbctxt: levbctxt,
      AbsenceParameters.levpsd: levpsd,
      AbsenceParameters.levncod: levncod,
      AbsenceParameters.levdftprltypid: levdftprltypid,
      AbsenceParameters.levdaysinyear4balcalid: levdaysinyear4balcalid,
      AbsenceParameters.levprvcalunpaid: levprvcalunpaid,
      AbsenceParameters.levdtusrdval: levdtusrdval,
      AbsenceParameters.levdsy4bval: levdsy4bval,
      AbsenceParameters.disFrmToTimeCtrls: disFrmToTimeCtrls,
      AbsenceParameters.cmpidd: cmpidd,
      AbsenceParameters.Company: Company
    };
    final id = await absenceParameters.insert(row);

  }

  insert_VacationEntryType({value, text, ValueSetID}) async {
    Map<String, dynamic> row = {
//      DatabaseHelper.columnName : 'Bob',
//      DatabaseHelper.columnAge  : 23,

//TODO BACKUP BEFORE API TESTING

      VacationEntryType.value: value,
      VacationEntryType.text: text,
      VacationEntryType.ValueSetID: ValueSetID,
    };
    final id = await vacationEntryType.insert(row);

  }

  insert_EmployeeAbsenceCodeAssignment(
      {recidd, cmpidd, company, lvccod, emplevidd, lvcidd  , defaultvalue,lvtidd}) async {
    Map<String, dynamic> row = {
//      DatabaseHelper.columnName : 'Bob',
//      DatabaseHelper.columnAge  : 23,

//TODO BACKUP BEFORE API TESTING

      EmployeeAbsenceCodeAssignment.recidd: recidd,
      EmployeeAbsenceCodeAssignment.cmpidd: cmpidd,
      EmployeeAbsenceCodeAssignment.company: company,
      EmployeeAbsenceCodeAssignment.lvccod: lvccod,
      EmployeeAbsenceCodeAssignment.emplevidd: emplevidd,
      EmployeeAbsenceCodeAssignment.lvcidd: lvcidd,
      EmployeeAbsenceCodeAssignment.defaultvalue: defaultvalue,
      EmployeeAbsenceCodeAssignment.lvtidd: lvtidd,





    };
    final id = await employeeAbsenceCodeAssignment.insert(row);

  }

  insert_Absence_Transaction(
      {recordIDD,
        entryType,
        transactionNumber,
        employeeIDD,
        employeeCode,
        entryDate,
        leaveTypeIDD,
        leaveTypeCode,
        LeaveCodeIDD,
        LeaveCode,
        calendarIDD,
        calendarCode,
        fromDate,
        toDate,
        rejoiningDate,
        calendarDays,
        weekendDays,
        holidays,
        leavedays,
        remarks1,
        remarks2,
        airTicket,
        EmployeeUserID,
        WorkflowMasterID,
        TRX_ID,
        RequestDate,
        SubmittedByUserID,
        NumberOfDays,
        Status,
        perDiem,
        leaveSalary,
        cashCheck,
        cashAmount,
        hourly,
        fromTime,
        toTime,
        offHours,
        dayPercentage,
        cmpidd,
        Company,
        OffMints,
        mobid,
        syncdate,
        syncstatus,
        operation

      }) async {
    Map<String, dynamic> row = {
//      DatabaseHelper.columnName : 'Bob',
//      DatabaseHelper.columnAge  : 23,

//TODO BACKUP BEFORE API TESTING

      Absence_Transaction.recordIDD: recordIDD,
      Absence_Transaction.entryType: entryType,
      Absence_Transaction.transactionNumber: transactionNumber,
      Absence_Transaction.employeeIDD: employeeIDD,
      Absence_Transaction.employeeCode: employeeCode,
      Absence_Transaction.entryDate: entryDate,
      Absence_Transaction.leaveTypeIDD: leaveTypeIDD,
      Absence_Transaction.leaveTypeCode: leaveTypeCode,
      Absence_Transaction.LeaveCodeIDD: LeaveCodeIDD,
      Absence_Transaction.LeaveCode: LeaveCode,
      Absence_Transaction.calendarIDD: calendarIDD,
      Absence_Transaction.calendarCode: calendarCode,
      Absence_Transaction.fromDate: fromDate,
      Absence_Transaction.toDate: toDate,
      Absence_Transaction.rejoiningDate: rejoiningDate,
      Absence_Transaction.calendarDays: calendarDays,
      Absence_Transaction.weekendDays: weekendDays,
      Absence_Transaction.holidays: holidays,
      Absence_Transaction.leavedays: leavedays,
      Absence_Transaction.remarks1: remarks1,
      Absence_Transaction.remarks2: remarks2,
      Absence_Transaction.airTicket: airTicket,
      Absence_Transaction.EmployeeUserID: EmployeeUserID,
      Absence_Transaction.WorkflowMasterID: WorkflowMasterID,
      Absence_Transaction.TRX_ID: TRX_ID,
      Absence_Transaction.RequestDate: RequestDate,
      Absence_Transaction.SubmittedByUserID: SubmittedByUserID,
      Absence_Transaction.NumberOfDays: NumberOfDays,
      Absence_Transaction.Status: Status,
      Absence_Transaction.perDiem: perDiem,
      Absence_Transaction.leaveSalary: leaveSalary,
      Absence_Transaction.cashCheck: cashCheck,
      Absence_Transaction.cashAmount: cashAmount,
      Absence_Transaction.hourly: hourly,
      Absence_Transaction.fromTime: fromTime,
      Absence_Transaction.toTime: toTime,
      Absence_Transaction.offHours: offHours,
      Absence_Transaction.dayPercentage: dayPercentage,
      Absence_Transaction.cmpidd: cmpidd,
      Absence_Transaction.Company: Company,
      Absence_Transaction.OffMints: OffMints,
      Absence_Transaction.mobid: mobid,
      Absence_Transaction.syncdate:syncdate,
      Absence_Transaction.syncstatus:syncstatus,
      Absence_Transaction.operation:operation


    };
    final id = await absence_Transaction.insert(row);

  }


  insert_Eb_prllevtrx_status(
      {
        ID,LeaveTransactionID,	MainApproverUserID,	ApprovedByUserID,	RequestStatusID,	UpdateDate,	Remarks,
        WorkflowID,	Processed  ,	ProcessedDate,	VoidedOnRecall  ,	WorkflowMasterID  ,	UserLevel  ,	MappingType ,
        Transremarks ,	groupidd  ,	groupcode  ,	approvingline  ,	levelversion ,	levelcolor  ,	tag  ,	cmpidd  ,	Company , seq,mobid,syncstatus,
        operation,syncdate


      }) async {
    Map<String, dynamic> row = {


//TODO BACKUP BEFORE API TESTING

      Eb_prllevtrx_status.ID: ID,
      Eb_prllevtrx_status.LeaveTransactionID: LeaveTransactionID,
      Eb_prllevtrx_status.MainApproverUserID: MainApproverUserID,
      Eb_prllevtrx_status.ApprovedByUserID: ApprovedByUserID,
      Eb_prllevtrx_status.RequestStatusID: RequestStatusID,
      Eb_prllevtrx_status.UpdateDate: UpdateDate,
      Eb_prllevtrx_status.Remarks: Remarks,
      Eb_prllevtrx_status.WorkflowID: WorkflowID,
      Eb_prllevtrx_status.Processed: Processed,
      Eb_prllevtrx_status.ProcessedDate: ProcessedDate,
      Eb_prllevtrx_status.VoidedOnRecall: VoidedOnRecall,
      Eb_prllevtrx_status.WorkflowMasterID: WorkflowMasterID,
      Eb_prllevtrx_status.UserLevel: UserLevel,
      Eb_prllevtrx_status.MappingType: MappingType,
      Eb_prllevtrx_status.Transremarks: Transremarks,
      Eb_prllevtrx_status.groupidd: groupidd,
      Eb_prllevtrx_status.groupcode: groupcode,
      Eb_prllevtrx_status.approvingline: approvingline,
      Eb_prllevtrx_status.levelversion: levelversion,
      Eb_prllevtrx_status.levelcolor: levelcolor,
      Eb_prllevtrx_status.tag: tag,
      Eb_prllevtrx_status.cmpidd: cmpidd,
      Eb_prllevtrx_status.Company: Company,
      Eb_prllevtrx_status.seq: seq,
      Eb_prllevtrx_status.mobid: mobid,
      Eb_prllevtrx_status.syncstatus: syncstatus,
      Eb_prllevtrx_status.operation: operation,
      Eb_prllevtrx_status.syncdate: syncdate,





    };
    final id = await eb_prllevtrx_status.insert(row);

  }

}

