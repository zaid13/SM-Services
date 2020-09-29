

import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sqflite/sqflite.dart';


//employ master
class EmpMaster_Timesheet {
//  static final _databaseName = "MyDatabase.db";


  static final table = 'EmpMaster_Timesheet';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';


  static final recidd = 'RecordID';

  static final empcod = 'EmployeeCode'; //  -- 1
  static final empid = 'EmpId';


  static final empfsn = 'FirstName';
  static final empmdn = 'MiddleName';
  static final emplsn = 'LastName';
  static final empprn = 'PrintingName';    // -- 2
  static final dptidd = 'DepartmentID';
  static final dptcod = 'DepartmentCode';  // -- 2
  static final posidd = 'PositionID';
  static final poscod = 'PositonCode';   // -- 3
  static final dividd = 'DivisionID';
  static final divcod = 'DivisionCode';
  static final empsts = 'Status';
  static final locidd = 'LocationID';
  static final loccod = 'LocationCode';
  static final empdoj = 'DateofJoining';
  static final addmbn = 'Mobile';
  static final addpre = 'Email';
  static final empact = 'Active';
  static final Calidd = 'CalendarID';
  static final Calcod = 'CalendarCode';
  static final ShfId =  'ShiftID';
  static final Shfcod = 'ShiftCode';
  static final cmpidd = 'CompanyID';
  static final empimg = 'EmployeePhoto'; //nav
  static final empDoE = 'age';
  static final userid = 'userid';
  static final dptnam = 'departmentname';
  static final posnam = 'positionname';




// make this a singleton class
  EmpMaster_Timesheet._privateConstructor();
  static final EmpMaster_Timesheet instance = EmpMaster_Timesheet._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await createdb();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
//  _initDatabase() async {
//    Directory documentsDirectory = await getApplicationDocumentsDirectory();
//    String path = join(documentsDirectory.path, table);
//    return await openDatabase(path,
//        version: _databaseVersion, onCreate: _onCreate);
//  }

  // SQL code to create the database table
  Future onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE  $table(
$recidd int NOT NULL,
$empcod nvarchar   NOT NULL,
$empid nvarchar ,
$empfsn nvarchar  NOT NULL,
$empmdn nvarchar ,
$emplsn nvarchar ,
$empprn nvarchar ,
$dptidd int,
$dptcod nvarchar ,
$posidd int,
$poscod nvarchar ,
$dividd int,
$divcod nvarchar ,
$empsts int NOT NULL,
$locidd int,
$loccod nvarchar ,
$empdoj int,
$addmbn nvarchar ,
$addpre nvarchar ,
$empact nvarchar ,
$Calidd int,
$Calcod varchar ,
$Shfcod varchar ,
$cmpidd int,
$empimg varbinary ,
$empDoE int,
$ShfId int ,
$userid nvarchar
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

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<List<Map<String, dynamic>>> queryonlyRows(String t, String str) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM ${table} WHERE ${t} = ${str} ;");
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteall() async {
    Database db = await instance.database;
    db.execute("delete from " + table);
    return 1;
  }
}