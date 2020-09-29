import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sqflite/sqflite.dart';
class Eb_prllevtrx_status {
//  static final _databaseName = "MyDatabase.db";


  static final table = 'Eb_prllevtrx_status';


  static final ID= 'ID';
  static final LeaveTransactionID= 'LeaveTransactionID';
  static final  MainApproverUserID= 'MainApproverUserID';
  static final ApprovedByUserID= 'ApprovedByUserID';
  static final RequestStatusID= 'RequestStatusID';
  static final UpdateDate= 'UpdateDate';
  static final Remarks= 'Remarks';
  static final WorkflowID= 'WorkflowID';
  static final Processed= 'Processed';
  static final ProcessedDate= 'ProcessedDate';
  static final VoidedOnRecall = 'VoidedOnRecall';
  static final WorkflowMasterID= 'WorkflowMasterID';
  static final UserLevel= 'UserLevel';
  static final MappingType= 'MappingType';
  static final Transremarks= 'Transremarks';
  static final groupidd= 'groupidd';
  static final groupcode= 'groupcode';
  static final approvingline= 'approvingline';
  static final levelversion= 'levelversion';
  static final levelcolor= 'levelcolor';
  static final tag= 'tag';
  static final cmpidd= 'cmpidd';
  static final Company= 'Company';
  static final seq= 'seq';
  static final mobid= 'mobid';
  static final syncstatus= 'syncstatus';
  static final operation= 'operation';
  static final syncdate= 'syncdate';






  Eb_prllevtrx_status._privateConstructor();
  static final Eb_prllevtrx_status instance =
  Eb_prllevtrx_status._privateConstructor();

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

$ID int,
$LeaveTransactionID int,
$MainApproverUserID int,
$ApprovedByUserID int,
$RequestStatusID int,
$UpdateDate varchar,
$Remarks varchar,
$WorkflowID int,
$Processed int,
$ProcessedDate varchar,
$VoidedOnRecall int,
$WorkflowMasterID int,
$UserLevel int,
$MappingType varchar,
$Transremarks varchar,
$groupidd int,
$groupcode varchar,
$approvingline int,
$levelversion varchar,
$levelcolor int,
$tag int,
$cmpidd int,
$Company nvarchar,
$seq int,
$syncstatus int default 0 ,
$mobid int ,
$operation text ,
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
    return await db.rawQuery("SELECT * FROM ${table} WHERE ${str} Like ${t} ;");
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
