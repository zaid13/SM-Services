import 'package:sqflite/sqflite.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';

class TimeSheetParameter {
//  static final _databaseName = "MyDatabase.db";


  static final table = 'TimeSheetParameter';
  static final recidd= 'recidd';
  static final btnsubtxt= 'btnsubtxt';
  static final btnsubmsg= 'btnsubmsg';
  static final isddlposvis= 'isddlposvis';   // position
  static final copypremvalues= 'copypremvalues';
  static final copyhrtvalues= 'copyhrtvalues';
  static final allowedit= 'allowedit';
  static final isprthisreq= 'isprthisreq';
  static final ishrthisreq= 'ishrthisreq';
  static final copyNvalue= 'copyNvalue';
  static final isFriOff= 'isFriOff';
  static final isSatOff= 'isSatOff';
  static final isSunOff= 'isSunOff';
  static final ishrtprthisreq= 'ishrtprthisreq';
  static final cmpidd= 'cmpidd';
  static final Company= 'Company';

  //visible

  static final isprjtpe= 'isprjtpe';    //  1
  static final isprjvis= 'isprjvis'; //  2
  static final isprjdtail= 'isprjdtail'; //  3
  static final isprjsbdtail= 'isprjsbdtail'; //  4

  static final isindpndnt= 'isindpndnt'; //  5
  static final isindpndnt2= 'isindpndnt2'; //  6
  static final isprjasgnreqd= 'isprjasgnreqd';
  static final isprjtpeasgnreqd= 'isprjtpeasgnreqd';
  static final isprjdtlasgnreqd= 'isprjdtlasgnreqd';
  static final isprjsbdtlasgnreqd= 'isprjsbdtlasgnreqd';

  //labels

  static final prjtypetitle= 'prjtypetitle';   //1
  static final prjtitle= 'prjtitle';  //2
  static final prjdtailtitle= 'prjdtailtitle';   //3
  static final prjsbdtailtitle= 'prjsbdtailtitle';   //4
  static final indpndnttitle= 'indpndnttitle';  //5
  static final indpndnt2title= 'indpndnt2title';  //6


  TimeSheetParameter._privateConstructor();
  static final TimeSheetParameter instance =
  TimeSheetParameter._privateConstructor();

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
 

$recidd int,
$btnsubtxt nvarchar,
$btnsubmsg nvarchar,
$isddlposvis int,
$copypremvalues int,
$copyhrtvalues int,
$allowedit int,
$isprthisreq int,
$ishrthisreq int,
$copyNvalue int,
$isFriOff int,
$isSatOff int,
$isSunOff int,
$ishrtprthisreq int,
$cmpidd int,
$Company nvarchar,
$isprjtpe int,
$isprjvis int,
$isprjdtail int,
$isprjsbdtail int,
$isindpndnt int,
$isindpndnt2 int,
$isprjasgnreqd int,
$isprjtpeasgnreqd int,
$isprjdtlasgnreqd int,
$isprjsbdtlasgnreqd int,
$prjtypetitle varchar,
$prjtitle varchar,
$prjdtailtitle varchar,
$prjsbdtailtitle varchar,
$indpndnttitle varchar ,
$indpndnt2title varchar



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
    return await db.update(table, row, where: '3 = 3');
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