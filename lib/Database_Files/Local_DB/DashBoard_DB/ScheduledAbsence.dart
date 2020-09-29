
import 'package:sqflite/sqflite.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';

class   ScheduledAbsence {
  //  static final _databaseName = "MyDatabase.db";


  static final table = 'ScheduledAbsence';

  static final EmployeeCode = 'EmployeeCode';
  static final FromDate = 'FromDate';
  static final LeaveCode   = 'LeaveCode';
  static final ToDate = 'ToDate';
  static final FromTime = 'FromTime';
  static final ToTime   = 'ToTime';
  static final Hourly = 'Hourly';





  ScheduledAbsence._privateConstructor();
  static final ScheduledAbsence instance =
  ScheduledAbsence._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await createdb();
    return _database;
  }



  // SQL code to create the database table
  Future onCreate(Database db, int version) async {

    await db.execute('''
          CREATE TABLE  $table(
            $LeaveCode varchar ,
            $EmployeeCode  varchar,
            $FromDate  varchar,
            $ToDate  varchar ,
            $ToTime  varchar ,
            $FromTime  varchar ,
            $Hourly  varchar 
            
    
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

  Future<List<Map<String, dynamic>>> queryonlyRows(
      String str,String o) async {
    Database db = await instance.database;
    return await db.rawQuery(
        "SELECT * FROM ${table}   WHERE  ${str} = ${o}   ;");
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

    return await db.update(table, row );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, whereArgs: [id]);
  }

  Future<int> deleteall() async {
    Database db = await instance.database;
    db.execute("delete from " + table);
    return 1;
  }
}