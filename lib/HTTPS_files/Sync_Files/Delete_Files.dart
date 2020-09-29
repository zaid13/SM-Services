
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

deleteEvent() async {

  final emp_master = EmpMaster.instance;
  final empAbsenceAssignments = EmpAbsenceAssignments.instance;
  final absenceTypes = AbsenceTypes.instance;
  final absenceCodes = AbsenceCodes.instance;
  final calendarDetails = CalendarDetails.instance;
  final calendarShifts = CalendarShifts.instance;
  final calendarHolidays = CalendarHolidays.instance;
  final absenceParameters = AbsenceParameters.instance;
  final  vacationEntryType= VacationEntryType.instance;
  final  employeeAbsenceCodeAssignment= EmployeeAbsenceCodeAssignment.instance;
  final menu  = Menu.instance;
  final absence_Transaction = Absence_Transaction.instance;


//  emp_master.deleteall();
  await emp_master.deleteall();
  await empAbsenceAssignments.deleteall();
  await absenceTypes.deleteall();
  await  absenceCodes.deleteall();
  await  calendarDetails.deleteall();
  await calendarShifts.deleteall();
  await  calendarHolidays.deleteall();
  await  absenceParameters.deleteall();
  await vacationEntryType.deleteall();
  await  employeeAbsenceCodeAssignment.deleteall();
  await menu.deleteall();
  await  absence_Transaction.deleteall();






}

