String  id= '';
String  pas = '';
String uid = '';
String path = '';
//todo   change emp id
String empid = '563';
bool isAuto = true;
int syncMinutes = 1;
var isolate;
double topbarHeight = 75;
double topbarTitleSize = 25;
String blueTextcol='#326995';
String greyTextcol='#2F3840';



String  GetEmployees                        = 'http://smemobapi.azurewebsites.net/api/Employee/GetEmployees';
  String  GetEmpList4User                   = 'http://smemobapi.azurewebsites.net/api/Employee/GetEmpList4User';
  String  GetEmployeeAbsenceAssignment      = 'http://smemobapi.azurewebsites.net/api/Employee/GetEmployeeAbsenceTypeAssignment';//2 //
  String  GetCalByEmp                       = 'http://smemobapi.azurewebsites.net/api/Employee/GetCalByEmp';
  String  GetCalendarHolidays               = 'http://smemobapi.azurewebsites.net/api/Employee/GetCalendarHolidays';
  String  GetAbsenceParameters          = 'http://smemobapi.azurewebsites.net/api/AbsenceTransactions/GetAbsenceParameters';
  String  GetVacationTypes              ="http://smemobapi.azurewebsites.net/api/vacation/GetVacationTypes";
  String  GetVacationCodes              ="http://smemobapi.azurewebsites.net/api/vacation/GetVacationCodes"; //3 old
  String  GetVacationEntryType          ="http://smemobapi.azurewebsites.net/api/vacation/GetVacationEntryType";   //4
  String  GetEmployeeAbsenceCodeAssignment = "http://smemobapi.azurewebsites.net/api/Employee/GetEmployeeAbsenceCodeAssignment"; //new 3
  String  GetInsertedAbsenceTransaction    = "http://smemobapi.azurewebsites.net/api/AbsenceTransaction/GetInsertedAbsenceTransactionToUpdateMobTable";
  String  GetInsertedAbsenceTransactionStatus= "http://smemobapi.azurewebsites.net/api/AbsenceTransaction/GetInsertedAbsenceTransactionStatus";
  String  GetNextScheduledAbsence4Dashboard = 'http://smemobapi.azurewebsites.net/api/Employee/GetNextScheduledAbsence4Dashboard?UserId=';
  String  GetVacationBalance4Dashboard  = "http://smemobapi.azurewebsites.net//api/vacation/GetVacationBalance4Dashboard?empidd=";
  String  GetGetNotificationCount = 'http://smemobapi.azurewebsites.net//api/Employee/GetNotificationCount?UserId=';
  String    GetTimeSheetParameters = 'http://smemobapi.azurewebsites.net/api/TimeSheetTransaction/GetTimeSheetParameters';
  // timesheet dropdowns   1
  String  GetPrjD1 = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjDD1?EmpId=';
  String  GetPrjD1WithoutAsgn = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjD1NonAssignment';
  // timesheet dropdowns    2
//  String  ProjectD2 = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjDD2?EmpId=563&PrjTypId=1';
//  String  ProjectD2NonAssignment = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjD1NonAssignment';
// timesheet dropdowns    3
//  String  ProjectD3 = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjDD3?EmpId=563&PrjTypId=1&PrjId=6';
//  String  ProjectD3NonAssignment = 'http://smemobapi.azurewebsites.net/api/Project/GetPrjD3NonAssignment?PrjId=24';

String  Project_independent_D1_1  = 'http://smemobapi.azurewebsites.net/api/Project/GetIndProject?Type=1';
String  Project_independent_D1_2  = 'http://smemobapi.azurewebsites.net/api/Project/GetIndProject?Type=2';

String GetLoggedinEmployee = "http://smemobapi.azurewebsites.net/api/Employee/GetLoggedinEmployee";


String GetAbsenceTransactions4User ="http://smemobapi.azurewebsites.net/api/AbsenceTransaction/GetAbsenceTransactions4User?userid=";
String GetAbsenceTransactionStatus4User="http://smemobapi.azurewebsites.net/api/AbsenceTransaction/GetAbsenceTransactionStatus4User?userid=";



enum Screen_type{
Absence_Request,
Saved_Request,
Pending_Request,
Submitted_Request,


  About,
  DashBoard,
  Timeline,


  Time_Sheet,
  Hour_,
  Premium_,
  Hour_Premium,


Saved_timesheet,
Submitted_timesheet,
Pending_timesheet,
Request_timesheet,

  Setting,
  Employee
}
String SelectStr = 'Select ';
var NUll;