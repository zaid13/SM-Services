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

class updating_allDB {
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


  update_notificationCount({

    notificationCountvar

  }) async {

    Map<String, dynamic> row = {
      NotificationCount.notificationCount: notificationCountvar,


    };

    final id = await notificationCount.insert(row);

  }

  update_vacationBalance({

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


  update_scheduledAbsence({

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

  update_Menue({

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
  update_Emp_master({
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
    userid
  }) async {
    Map<String, dynamic> row = {
      EmpMaster.recidd: recidd,
      EmpMaster.empcod: empcod,
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

  update_AbsenceTypes(
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

  update_AbsenceCodes(
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


  update_EmpAbsenceAssignments(
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

  update_CalendarShifts(
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

  update_CalendarHolidays({
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

  update_AbsenceParameters({
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

  update_EmployeeAbsenceCodeAssignment(
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

  update_Absence_Transaction(
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
        operation ,
        oldmobileid

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
//      Absence_Transaction.mobid: mobid,
      Absence_Transaction.syncdate:syncdate,
      Absence_Transaction.syncstatus:syncstatus,
      Absence_Transaction.operation:operation


    };
    final id = await absence_Transaction.update(row, oldmobileid
    );

  }


  update_Eb_prllevtrx_status(
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

