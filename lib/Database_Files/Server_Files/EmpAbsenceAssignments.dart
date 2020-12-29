import 'dart:math';

import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sqflite/sqflite.dart';
//absnce employee assignment
class EmpAbsenceAssignments {
  //  static final _databaseName = "MyDatabase.db";


  static final table = 'eb_prlemplev12';

//  static final _databaseName = "SMEServices.db";
//
//  static final table = 'EmpMaster';

  static final recidd = 'RecordID';
  static final empidd = 'EmployeeID';
  static final empcod = 'EmployeeCode';
  static final lvtidd = 'LeaveTypeid';
  static final lvtcod = 'LeaveTypeCode';   //  1
  static final levdftpln = 'levdftpln';
  static final levenc = 'levenc';
  static final cmpidd = 'CompanyID';
  static final Company = 'CompanyCode';
  static final mobid = 'mobid';
  static final defaultvalue = 'defaultvalue';
  static final levdsc = 'levdsc';



  // make this a singleton class
  EmpAbsenceAssignments._privateConstructor();
  static final EmpAbsenceAssignments instance =
  EmpAbsenceAssignments._privateConstructor();

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
$recidd int NOT NULL   ,
$empidd int NOT NULL   ,
$empcod nvarchar NOT NULL      ,
$lvtidd int NOT NULL  ,
$lvtcod nvarchar NOT NULL      ,
$levdftpln int    ,
$levenc int    ,
$cmpidd int    ,
$Company nvarchar  ,
$mobid varchar DEFAULT "${Random().nextInt(10000000).toString()+DateTime.now().millisecondsSinceEpoch.toString()}" ,
$defaultvalue  nvarchar,
$levdsc nvarchar

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

  Future<List<Map<String, dynamic>>> queryrecidd() async {
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

  Future<List<Map<String, dynamic>>> queryonlyRows(t, String str) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM ${table} WHERE ${str} =   '${t}' ;");
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
//    Database db = await instance.database;
//    int id = row[columnId];
//    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
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
