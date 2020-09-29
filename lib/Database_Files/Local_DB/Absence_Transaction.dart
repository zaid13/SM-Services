import 'package:sqflite/sqflite.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';

class Absence_Transaction {
//  static final _databaseName = "MyDatabase.db";


  static final table = 'Absence_Transaction1';
  static final recordIDD = "recordIDD";
  static final entryType = "entryType"; //LIST
  static final transactionNumber = "transactionNumber";
  static final employeeIDD = "employeeIDD";
  static final employeeCode = "employeeCode"; //LIST
  static final entryDate = "entryDate";
  static final leaveTypeIDD = "leaveTypeIDD";
  static final leaveTypeCode = "leaveTypeCode"; //LIST
  static final LeaveCodeIDD = "LeaveCodeIDD";
  static final LeaveCode = "LeaveCode"; //LIST
  static final calendarIDD = "calendarIDD";
  static final calendarCode = "calendarCode";
  static final fromDate = "fromDate";
  static final toDate = "toDate";
  static final rejoiningDate = "rejoiningDate";
  static final calendarDays = "calendarDays";
  static final weekendDays = "weekendDays";
  static final holidays = "holidays";
  static final leavedays = "leavedays";
  static final remarks1 = "remarks1";
  static final remarks2 = "remarks2";
  static final airTicket = "airTicket";
  static final EmployeeUserID = "EmployeeUserID";
  static final WorkflowMasterID = "WorkflowMasterID";
  static final TRX_ID = "TRX_ID";
  static final RequestDate = "RequestDate";
  static final SubmittedByUserID = "SubmittedByUserID";
  static final NumberOfDays = "NumberOfDays";
  static final Status = "Status";
  static final perDiem = "perDiem";
  static final leaveSalary = "leaveSalary";
  static final cashCheck = "cashCheck";
  static final cashAmount = "cashAmount";
  static final hourly = "hourly";
  static final fromTime = "fromTime";
  static final toTime = "toTime";
  static final offHours = "offHours";
  static final dayPercentage = "dayPercentage";
  static final cmpidd = "cmpidd";
  static final Company = "Company";
  static final OffMints = "OffMints";
  static final mobid = "mobid";  //LIST

  static final syncstatus= 'syncstatus';
  static final syncdate= 'syncdate';
  static final operation= 'operation';


  Absence_Transaction._privateConstructor();
  static final Absence_Transaction instance =
  Absence_Transaction._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await createdb();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)


  // SQL code to create the database table
  Future onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE  $table(
         
  $recordIDD  INT, 
  $entryType  INT,
  $transactionNumber TEXT,
  $employeeIDD INT,
  $employeeCode TEXT,
  $entryDate INT ,
  $leaveTypeIDD INT,
  $leaveTypeCode TEXT,
  $LeaveCodeIDD INT,
  $LeaveCode TEXT,
  $calendarIDD INT,
  $calendarCode TEXT,
  $fromDate INT,
  $toDate INT ,
  $rejoiningDate INT,
  $calendarDays REAL,
  $weekendDays INT,
  $holidays  INT,
  $leavedays REAL,
  $remarks1  TEXT,
  $remarks2 TEXT,
  $airTicket  INT,
  $EmployeeUserID INT ,
  $WorkflowMasterID INT ,
  $TRX_ID INT,
  $RequestDate INT ,
  $SubmittedByUserID INT  ,
  $NumberOfDays REAL ,
  $Status INT  ,
  $perDiem INT  ,
  $leaveSalary INT ,
  $cashCheck INT  ,
  $cashAmount REAL ,
  $hourly INT  ,
  $fromTime INT ,
  $toTime INT  ,
  $offHours  REAL ,
  $dayPercentage REAL ,
  $cmpidd INT  ,
  $Company TEXT  ,
  $OffMints INT  ,
  $mobid text  ,
  $syncstatus int ,
  $operation  TEXT ,
  $syncdate int 

  )
          
          ''');
  }
//  PositionID

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
//  EmployeeAbsenceCodeAssignment

  Future<List<Map<String, dynamic>>> queryonlyRows(t, String str) async {

    Database db = await instance.database;


    var res = await db.rawQuery("SELECT * FROM ${table} WHERE ${str} like '${t}' ");



    return res;
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row,id) async {
    Database db = await instance.database;
    return await db.update(table, row, where: '$mobid = $id');
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
//    Database db = await instance.database;
//    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteall() async {
    Database db = await instance.database;
    db.execute("delete from " + table);
    return 1;
  }
}