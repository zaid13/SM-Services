//calenmder shifts
import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sqflite/sqflite.dart';

class CalendarShifts {
//  static final _databaseName = "MyDatabase.db";


  static final table = 'CalendarShifts';

  static final recidd = 'RecordID';
  static final calidd = 'CalendarId';
  static final calcod = 'CalendarCode';
  static final calsid = 'ShiftId';
  static final calsod = 'Shiftcode';
  static final caldid = 'daytypeid';
  static final caltds = 'daytypecode';
  static final caltmi = 'timein';
  static final caltmo = 'timeout';
  static final callta = 'latetimein';
  static final callve = 'earlytimeout';
  static final calovs = 'overtime1start';
  static final calnss = 'overtime2start';
  static final cmpidd = 'Companyid';
  static final Company = 'CompanyCode';

  CalendarShifts._privateConstructor();
  static final CalendarShifts instance = CalendarShifts._privateConstructor();

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
  Future  onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE  $table(
          
$recidd int NOT NULL  ,
$calidd int NOT NULL ,
$calcod nvarchar NOT NULL,
$calsid int NOT NULL ,
$calsod nvarchar NOT NULL,
$caldid int NOT NULL ,
$caltds nvarchar NOT NULL,
$caltmi int NOT NULL ,
$caltmo int NOT NULL ,
$callta int NOT NULL ,
$callve int NOT NULL ,
$calovs int NOT NULL ,
$calnss int NOT NULL ,
$cmpidd int ,
$Company nvarchar 
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

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
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
