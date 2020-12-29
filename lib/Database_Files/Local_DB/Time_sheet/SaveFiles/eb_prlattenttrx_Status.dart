






import 'package:sqflite/sqflite.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';

class eb_prlattenttrx_Status {
//  static final _databaseName = "MyDatabase.db";


  static final table = 'eb_prlattenttrx_Status';


  static final ID= 'ID';
  static final AttEntTrxID= 'AttEntTrxID';
  static final MainApproverUserID= 'MainApproverUserID';
  static final ApprovedByUserID= 'ApprovedByUserID';
  static final RequestStatusID= 'RequestStatusID';
  static final UpdateDate= 'UpdateDate';
  static final Remarks= 'Remarks';
  static final WorkflowID= 'WorkflowID';
  static final Processed= 'Processed';
  static final ProcessedDate= 'ProcessedDate';
  static final VoidedOnRecall= 'VoidedOnRecall';
  static final WorkflowMasterID= 'WorkflowMasterID';
  static final UserLevel= 'UserLevel';
  static final MappingType= 'MappingType';
  static final Transremarks= 'Transremarks';
  static final groupidd= 'groupidd';
  static final groupcode= 'groupcode';
  static final approvingline= 'approvingline';
  static final levelversion= 'levelversion';
  static final tag= 'tag';
  static final seq= 'seq';
  static final cmpidd= 'cmpidd';
  static final Company= 'Company';

  static final mobid= 'mobid';


  eb_prlattenttrx_Status._privateConstructor();
  static final eb_prlattenttrx_Status instance =
  eb_prlattenttrx_Status._privateConstructor();

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
         
$ID nvarchar,
$AttEntTrxID nvarchar,
$MainApproverUserID nvarchar,
$ApprovedByUserID nvarchar,
$RequestStatusID nvarchar,
$UpdateDate nvarchar,
$Remarks nvarchar,
$WorkflowID nvarchar,
$Processed nvarchar,
$ProcessedDate nvarchar,
$VoidedOnRecall nvarchar,
$WorkflowMasterID nvarchar,
$UserLevel nvarchar,
$MappingType varchar,
$Transremarks nvarchar,
$groupidd nvarchar,
$groupcode varchar,
$approvingline nvarchar,
$levelversion varchar,
$tag nvarchar,
$seq nvarchar,
$cmpidd nvarchar,
$Company nvarchar,
$mobid varchar






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

  Future<List<Map<String, dynamic>>> queryonlyRowsWith5_var(String str,t ,str1,t1,t2 ,str2,t3 ,str3,t4 ,str4 ) async {

    Database db = await instance.database;

    var res = await db.rawQuery("SELECT * FROM ${table} WHERE ${str} = '${t}'  AND  ${str1} = '${t1}' AND  ${str2} = '${t2}' AND ${str3} = '${t3}' AND ${str4} = '${t4}'");



    return res;
  }

  Future<List<Map<String, dynamic>>> queryonlyRows(t, String str) async {

    Database db = await instance.database;

    var res = await db.rawQuery("SELECT * FROM ${table} WHERE ${str} like '${t}%' ");



    return res;
  }
   deleteonly(t, String str) async {

    Database db = await instance.database;


     db.rawQuery("DELETE FROM ${table} WHERE ${str} LIKE   '${t}%' ");
return 1;



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
    return await db.update(table, row, where: '2=2');
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