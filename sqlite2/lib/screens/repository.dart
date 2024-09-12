import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  //insert user
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  //Read User
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  //read single record by id
  readDatabyid(table, userid) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [userid]);
  }

  //update user
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Delete User
  deleteDatabyid(table, userid) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$userid");
  }
}
