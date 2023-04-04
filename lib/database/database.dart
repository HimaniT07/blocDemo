import 'dart:io';

import 'package:himani_logbinary/utils/app_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const orderTABLE = AppConstants.orderTable;

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + AppConstants.dbName;
    var database = await openDatabase(path,
        version: 1, onCreate: initDB);
    return database;
  }

  void initDB(Database database, int version) async {
    await database.execute('''
    CREATE TABLE $orderTABLE (
        id INTEGER PRIMARY KEY,
        order_id INTEGER UNIQUE,
        sequence_no INTEGER,
        order_type TEXT,
        expected_Date TEXT
        )
        ''');
  }
}