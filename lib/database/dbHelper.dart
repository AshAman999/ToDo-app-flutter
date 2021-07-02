import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:to_do/database/todo-item.dart';

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'list';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async => await db.execute(
      'CREATE TABLE todo_items (id INTEGER PRIMARY KEY NOT NULL, task STRING, complete BOOLEAN)');

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, Task task) async =>
      await _db.insert(table, task.toMap());

  static Future<int> update(String table, Task task) async => await _db
      .update(table, task.toMap(), where: 'id = ?', whereArgs: [task.id]);

  static Future<int> delete(String table, Task task) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [task.id]);
}
