import 'dart:io';
import 'dart:async';
import 'package:counters/counter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  final String tableName = 'counterTbl';
  final String columnId = 'id';
  final String columnCountAmount = 'countAmount';

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'counter.db');
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, $columnCountAmount INTEGER)',
    );
    print('table created');
  }

  //insertion
  Future<int> saveItem(Counter item) async {
    var dbClient = await db;
    int res = await dbClient.insert('$tableName', item.toMap());
    print(res.toString());
    return res;
  }

  Future<List> getItems() async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery('SELECT * FROM $tableName');
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  Future<Counter> getItem(int id) async {
    var dbClient = await db;
    var result =
        await dbClient.rawQuery('SELECT * FROM $tableName WHERE id = $id');
    if (result.length == 0) return null;
    return Counter.fromMap(result.first);
  }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateItem(Counter item) async {
    var dbClient = await db;
    return await dbClient.update(tableName, item.toMap(),
        where: '$columnId = ?', whereArgs: [item.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
