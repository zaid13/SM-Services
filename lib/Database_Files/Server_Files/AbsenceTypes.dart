

import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sqflite/sqflite.dart';









//absnece types
class AbsenceTypes {
//  static final _databaseName = "MyDatabase.db";


  static final table = 'AbsenceTypes';

  static final recidd = 'RecordID';
  static final levtypcod = 'LeaveTypeCode';
  static final levdft = 'Defaultval';
  static final levdsc = 'Description';
  static final levsld = 'ShortDescription';
  static final levbso = 'LeaveBasedon';
  static final levsbo = 'SalaryBasedOn';
  static final levfba = 'PublicHolidayExcluded';
  static final levsal = 'LeaveSalaryAllowed';
  static final levfrw = 'LeaveForwardAllowed';
  static final levenc = 'LeaveEncashmentAllowed';
  static final levprv = 'LeaveProvision';
  static final levfrq = 'levfrq';
  static final levday = 'levday';
  static final levall = 'SpecialAllowanceReplacement';
  static final levnew = 'NewEmployeeLeave';
  static final levper = 'levper';
  static final levcol = 'LeaveColor';
  static final leveos = 'EOSRecalculate';
  static final levmabf = 'MaxBalance';
  static final levabz = 'BelowZeroAllowed';
  static final levnjd = 'NewJoinDuration';
  static final levnb = 'NegativeBalance';
  static final levsd = 'SameDepartment';
  static final levsp = 'SamePosition';
  static final levsol = 'SalaryonLeave';
  static final leveddl = 'ExpiryDocument';
  static final levfbz = 'FallBelowzero';
  static final cmpidd = 'CompanyID';
  static final Company = 'CompanyCode';
  static final levperdiem = 'PerDiemAllowed';
  static final levadvcash = 'AdvanceCashAllowed';
  static final levmaxcash = 'MaxCash';
  static final TrvTktAll = 'TicketAllowed';
  static final LevplnAll = 'PlanningAllowed';
  static final AdvnSalryRe = 'AdvnSalryRe';
  static final levSalryRe = 'levSalryRe';
  static final IsPaidLeave = 'PaidLeave';
  static final LevadjAll = 'AdjustmentAllowed';

  AbsenceTypes._privateConstructor();
  static final AbsenceTypes instance = AbsenceTypes._privateConstructor();

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
$levtypcod nvarchar NOT NULL     ,
$levdft int NOT NULL  ,
$levdsc nvarchar NOT NULL    ,
$levsld nvarchar NOT NULL    ,
$levbso int NOT NULL ,
$levsbo int NOT NULL ,
$levfba int  NOT NULL,
$levsal int  NOT NULL ,
$levfrw int  NOT NULL ,
$levenc int  NOT NULL ,
$levprv int NOT NULL ,
$levfrq int  ,
$levday REAL  ,
$levall int  NOT NULL ,
$levnew int NOT NULL ,
$levper REAL  ,
$levcol nvarchar   ,
$leveos int    ,
$levmabf REAL    ,
$levabz REAL     ,
$levnjd REAL     ,
$levnb int    , 
$levsd int    ,
$levsp int    ,
$levsol int    ,
$leveddl int  ,
$levfbz int    ,
$cmpidd int     ,
$Company nvarchar     ,
$levperdiem int     ,
$levadvcash int      ,
$levmaxcash REAL     ,
$TrvTktAll int       ,
$LevplnAll int      ,
$AdvnSalryRe int      ,
$levSalryRe int       ,
$IsPaidLeave int      ,
$LevadjAll int      

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

  Future<List<Map<String, dynamic>>> queryonlyRows(t, String str) async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM ${table} WHERE ${str} Like ${t} ;");
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
