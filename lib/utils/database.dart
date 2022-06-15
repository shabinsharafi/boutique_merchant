/*
import 'dart:io';
import 'package:play_club/logger.dart';
import 'package:play_club/models/user.dart';
import 'package:play_club/models/userSql.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "recruit.db");
    return await openDatabase(path, version: 3, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Users ("
          "id INTEGER PRIMARY KEY,"
          "userId TEXT,"
          "email TEXT,"
          "token TEXT,"
          "type TEXT,"
          "password TEXT"
          ")");
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      await db.execute("DROP TABLE Users");
      await db.execute("CREATE TABLE Users ("
          "id INTEGER PRIMARY KEY,"
          "userId TEXT,"
          "email TEXT,"
          "token TEXT,"
          "type TEXT,"
          "password TEXT"
          ")");
    });
  }

  addUserToDatabase(UserSql user) async {
    final db = await database;
    try {
      await deleteAllUsers();
    } catch (e) {
      print(e);
    }
    var raw = await db.insert(
      "Users",
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    getUser();
    return raw;
  }

  //delete person with id
  deleteUserWithId(int id) async {
    final db = await database;
    return db.delete("Users", where: "id = ?", whereArgs: [id]);
  }

  deleteAllUsers() async {
    final db = await database;
    db.delete("Users");
  }

  Future<List<UserSql>> getAllPersons() async {
    final db = await database;
    var response = await db.query("Users");
    List<UserSql> list = response.map((c) => UserSql.map(c)).toList();
    return list;
  }

  Future<bool> checkUserSignIn() async {
    final db = await database;
    var response = await db.query("Users");
    List<UserSql> list = response.map((c) => UserSql.map(c)).toList();
    return list.length != 0;
  }

  //return single person with id
  Future<void> updateUserField(int id, dynamic value, String field) async {
    final db = await database;
    return await db
        .rawUpdate('UPDATE Users SET $field = "$value" WHERE userId = $id');
  }

  //return single person with id
  Future<UserSql> getUserWithId(int id) async {
    final db = await database;
    var response =
        await db.query("Users", where: "userId = ?", whereArgs: [id]);
    return response.isNotEmpty ? UserSql.map(response.first) : null;
  }

//  Future<int> updateCustomer(Customer customer) async {
//    return await database.rawUpdate(
//      'UPDATE Customer SET first_name = ${customer.firstName} WHERE id = ${customer.id}'
//    );
//  }

  //return single person with id
  Future<UserSql> getUser() async {
    final db = await database;
    var response = await db.query("Users");
    List<UserSql> list = response.map((c) => UserSql.map(c)).toList();
    Logger.log("list", list.toString());
    return list.length > 0 ? UserSql.map(response.first) : null;
  }
}
*/
