import 'dart:async';

import 'package:ecobike_rental/data/model/address.dart';
import 'package:ecobike_rental/data/model/station.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Model {
  Map<String, dynamic> toMap() {}

  String getTableName() {}
}

class DatabaseImp {
  static Future<Database> connect() async {
    var addressTableName = Address.tableName;
    var addressKey = Address.key;
    var addressTableStr =
        "CREATE TABLE $addressTableName ($addressKey INTEGER PRIMARY KEY, latitude REAL, longitude REAL)";
    var stationTableName = Station.tableName;
    var stationKey = Station.key;
    var stationTableStr =
        "CREATE TABLE IF NOT EXISTS $stationTableName ($stationKey INTEGER PRIMARY KEY, stationName TEXT, addressId INTEGER, emailAddress TEXT, phoneNumber TEXT, area REAL)";
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
    Database db = await connect();
    int result = await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    return result;
  }

  static Future insert(Model model) async {
    Database db = await connect();
    int result = await db.insert(model.getTableName(), model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  static Future<List<Map<String, dynamic>>> getModels(String tableName) async {
    Database db = await connect();
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps;
  }

  static Future<Map<String, dynamic>> getModel(
      String tableName, int id, String key) async {
    Database db = await connect();
    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '"$key" = ?', whereArgs: [id]);
    return maps[0];
  }
}
