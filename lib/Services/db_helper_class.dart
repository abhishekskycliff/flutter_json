import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_json_app/Model/User_class.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{

  static final _databaseName ='MyDatabase.db';
  static final _databaseVersion = 1;

  static final table ='my_table';
  static final columnId ='_id';
  static final columnName = '_name';
  static final columnemail ='_email';


  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if(_database != null)
      return _database;

// if the database is null
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onOpen: (instance){},
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE $table(
    $columnId INTEGER PRIMARY KEY,
    $columnName TEXT NOT NULL,
    $columnemail TEXT NOT NUll
    )
    ''');
  }

  newClient(User_info newClient) async {
    final db = await database;
    var res = await db.insert("my_table", newClient.toJson());
    print(res);
    return res;
  }

  Future getAllClients() async {
    final db = await database;
    var res = await db.query("my_table");
    print(res);
     List<User_info> list = res.isNotEmpty ? res.map((c) => User_info.fromJson(c)).toList() : [];
     return list;
  }

  // Future<int> insert(Map<String, dynamic> row) async{
  //   Database db = await instance.database;
  //   return await db.insert(table, row);
  // }
  //
  // Future<List<Map<String, dynamic>>> queryAllRows() async{
  //   Database db = await instance.database;
  //   return await db.query(table);
  // }
  //
  // Future<int> queryRowCount() async{
  //   Database db = await instance.database;
  //   return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  // }
  //
  // Future<int> update(Map<String, dynamic> row) async{
  //   Database db = await instance.database;
  //   int id = row[columnId];
  //   return await db.update(table, row,where: '$columnId = ?', whereArgs: [id]);
  // }
  //
  // Future<int> delete(int id) async{
  //   Database db = await instance.database;
  //   return await db.delete(table, where:'$columnId = ?', whereArgs: [id]);
  // }

}