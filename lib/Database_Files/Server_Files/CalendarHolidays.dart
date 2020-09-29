//calender hoplidays
import 'package:sqflite/sqflite.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';

class CalendarHolidays {
//  static final _databaseName = "MyDatabase.db";


  static final table = 'CalendarHolidays';

  static final recidd = 'RecordID';
  static final calidd = 'Calendarid';
  static final calcod = 'Calendarcode';
  static final calext = 'EstimatedDate';
  static final calact = 'ActualDate';
  static final calholidd = 'HolidayTypeid';
  static final calholcod = 'HolidayTypeCode';
  static final caldsc = 'Description';
  static final cmpidd = 'CompanyID';
  static final Company = 'CompanyCode';
  static final holcol = 'Color';

  CalendarHolidays._privateConstructor();
  static final CalendarHolidays instance =
  CalendarHolidays._privateConstructor();

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
          
$recidd int NOT NULL ,
$calidd int NOT NULL ,
$calcod nvarchar NOT NULL ,
$calext int  NOT NULL ,
$calact int ,
$calholidd int NOT NULL ,
$calholcod nvarchar  NOT NULL ,
$caldsc nvarchar NOT NULL ,
$cmpidd int,
$Company nvarchar ,
$holcol nvarchar
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
