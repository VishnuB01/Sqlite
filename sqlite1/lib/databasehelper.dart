import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "your_database.db");
    print("Database path: $path"); // Print the path here
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE your_table(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database as Database;
    return await db.insert('your_table', row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await database as Database;
    return await db.query('your_table');
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await database as Database;
    int id = row['id'];
    return await db.update('your_table', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await database as Database;
    return await db.delete('your_table', where: 'id = ?', whereArgs: [id]);
  }
}
