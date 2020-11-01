import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/NotificationCount.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/ScheduledAbsence.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/VacationBalance.dart';
import 'package:sm_service/Database_Files/Local_DB/Menu.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD2.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD3.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD4.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/HourType/Hour_Type.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Position.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/PremiumType/PremiumType_db.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Hour.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Hour_Premium.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Premium.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/TimeSheetParameter.dart';
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
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/EmpMaster_timesheet.dart';

import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD2.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlattenttrx_Status.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_prt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_hrt_prt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatm.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatt.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/SaveFiles/eb_prlempatd_hrt.dart';

deleteEvent() async {
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
  final menu = Menu.instance;
  final absence_Transaction = Absence_Transaction.instance;

  final eb_prllevtrx_status = Eb_prllevtrx_status.instance;

  final scheduledAbsence = ScheduledAbsence.instance;

  final vacationBalance = VacationBalance.instance;
  final notificationCount = NotificationCount.instance;

  final timeSheetParameter = TimeSheetParameter.instance;
  final empMaster_Timesheet = EmpMaster_Timesheet.instance;
  final projectD1 = ProjectD1.instance;
  final projectD2 = ProjectD2.instance;
  final projectD3 = ProjectD3.instance;
  final projectD4 = ProjectD4.instance;
  final independent_dropDown_1 = Independent_dropDown_1.instance;
  final independent_dropDown_2 = Independent_dropDown_2.instance;
  final premium_type_db = Premium_type_db.instance;
  final hourTypes = HourTypes.instance;
  final timesheet_Hour_Premium = Timesheet_Hour_Premium.instance;
  final timesheet_Premium = Timesheet_Premium.instance;
  final timesheet_Hour = Timesheet_Hour.instance;

  final Eb_prlempatt = eb_prlempatt.instance;
  final Eb_prlempatm = eb_prlempatm.instance;
  final Eb_prlattenttrx_Status = eb_prlattenttrx_Status.instance;
  final Eb_prlempatd_hrt = eb_prlempatd_hrt.instance;
  final Eb_prlempatd_prt = eb_prlempatd_prt.instance;
  final Eb_prlempatd_hrt_prt = eb_prlempatd_hrt_prt.instance;



//  emp_master.deleteall();
  await emp_master.deleteall();
  await empAbsenceAssignments.deleteall();
  await absenceTypes.deleteall();
  await absenceCodes.deleteall();
  await calendarDetails.deleteall();
  await calendarShifts.deleteall();
  await calendarHolidays.deleteall();
  await absenceParameters.deleteall();
  await vacationEntryType.deleteall();
  await employeeAbsenceCodeAssignment.deleteall();
  // await menu.deleteall();
  // await absence_Transaction.deleteall();


await  eb_prllevtrx_status  .deleteall();
await  scheduledAbsence  .deleteall();
await  vacationBalance  .deleteall();
await  notificationCount  .deleteall();
await  timeSheetParameter  .deleteall();
await  empMaster_Timesheet  .deleteall();
await  projectD1  .deleteall();
await  projectD2  .deleteall();
await  projectD3  .deleteall();
await  projectD4  .deleteall();
await  independent_dropDown_1  .deleteall();
await  independent_dropDown_2  .deleteall();
await  premium_type_db  .deleteall();
await  hourTypes  .deleteall();




await  Eb_prlempatt.deleteall();
await  Eb_prlempatm.deleteall();
await  Eb_prlattenttrx_Status.deleteall();
await  Eb_prlempatd_hrt.deleteall();
await  Eb_prlempatd_prt.deleteall();
await  Eb_prlempatd_hrt_prt.deleteall();

// await  timesheet_Hour_Premium  .deleteall();
// await  timesheet_Premium  .deleteall();
// await  timesheet_Hour  .deleteall();





}
