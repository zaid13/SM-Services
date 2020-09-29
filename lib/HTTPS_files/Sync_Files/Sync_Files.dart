import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';
import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/NotificationCount.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/ScheduledAbsence.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/VacationBalance.dart';
import 'package:sm_service/Database_Files/Local_DB/Menu.dart';
import 'package:sm_service/Database_Files/Local_DB/SigninUser.dart';
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
import 'package:sm_service/HTTPS_files/DB_Init_Function.dart';
import 'package:sm_service/HTTPS_files/Sync_Files/Delete_Files.dart';



syncEvent() async {




  bool c = await checkServerConnection(GetEmployees,id,pas);

  if(c == true){
    print("syncEvent");

    await deleteEvent();


    await initGetEmployeeAbsenceCodeAssignment(); //new 3
    await initabsenceCodes();
    await initVacationEntryType();
    await initempAbsenceAssignments();
    await initemp_master();
    await initabsenceTypes();
    await iningetmenu();
    await  intiDash();;
    String isprjasgnreqd = await init_timesheet();

    await initemp_master_Timesheet();

    await init_ProjectD1(isprjasgnreqd);
    await init_ProjectD2(isprjasgnreqd);
    await init_ProjectD3(isprjasgnreqd);
    await init_ProjectD4(isprjasgnreqd);

    await init_insert_independent_dropDown_1();
    await init_insert_independent_dropDown_2();
    await init_insert_Premium_type(1);
    await init_insert_Hour_type();

//    await init_current_user();













    SigninUser signinUser = SigninUser.instance;

    List ls = await signinUser.queryAllRows();




    return true;

  }
  else{
return false;
  }


//  deleteEvent();


//initCalendarDetails();
//  initabsence_Transaction();
//  initabsence_Transaction_Status();


//todo followiung are not called


//  initabsenceTypes();

//
//initcalendarShifts();
//initcalendarHolidays();
//initabsenceParameters();


}

