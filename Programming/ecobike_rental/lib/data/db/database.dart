import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/address.dart';
import '../model/station.dart';


class Model {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{};
  }

  String getTableName() {
    return "";
  }
}

class DatabaseImp {
  static Future<Database> connect() async {
    final addressTableName = Address.tableName;
    final addressKey = Address.key;
    final addressTableStr =
        "CREATE TABLE $addressTableName ($addressKey INTEGER PRIMARY"
        " KEY, latitude REAL, longitude REAL)";
    final stationTableName = Station.tableName;
    final stationKey = Station.key;
    final stationTableStr =
        "CREATE TABLE IF NOT EXISTS $stationTableName ($stationKey "
        "INTEGER PRIMARY KEY, stationName TEXT, addressId INTEGER, "
        "emailAddress TEXT, phoneNumber TEXT, area REAL)";
    return openDatabase(
      join(await getDatabasesPath(), 'db00.db'),
      onCreate: (db, version) async {
        debugPrint("create table $stationTableStr $addressTableStr");
        await db.execute(addressTableStr);
        return;
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        debugPrint("create table $stationTableStr $addressTableStr");
        await db.execute(stationTableStr);
        return;
      },
      version: 3,
    );
  }

  static Future delete(int id, String tableName) async {
    final db = await connect();
    final result = await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    return result;
  }

  static Future insert(Model model) async {
    final db = await connect();
    final result = await db.insert(model.getTableName(), model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  static Future<List<Map<String, dynamic>>> getModels(String tableName) async {
    final db = await connect();
    final maps = await db.query(tableName);
    return maps;
  }

  static Future<Map<String, dynamic>> getModel(
      String tableName, int id, String key) async {
    final db = await connect();
    final maps =
        await db.query(tableName, where: '"$key" = ?', whereArgs: [id]);
    return maps[0];
  }
}
