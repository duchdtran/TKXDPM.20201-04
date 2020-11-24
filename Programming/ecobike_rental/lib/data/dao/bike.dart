import 'package:sqflite/sqflite.dart';

import '../model/models.dart';

class BikeDao{

  Database db;


  BikeDao(this.db);

  static Future<int> saveBike(Bike bike) async{
    // final dbClient = db;
    // int res = await dbClient.insert("Bike", bike.toJson());
    // return res;
  }

  static Future<Bike> getBike(int bikeId) async{
// var dbClient = await db;
    // List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    // List<User> employees = new List();
    // for (int i = 0; i < list.length; i++) {
    //   var user = User(list[i]["firstname"], list[i]["a"], list[i]["dob"]);
    //   user.setUserId(list[i]["id"]);
    //   employees.add(user);
    // }
    // print(employees.length);
    // return employees;
  }

  static Future<int> deleteBike(Bike bike) async{
    // var dbClient = await db;
    //
    // int res =
    // await dbClient.rawDelete('DELETE FROM User WHERE id = ?', [user.id]);
    // return res;
  }

  static Future<bool> updateBike(Bike bike) async{
    // var dbClient = await db;
    // int res =   await dbClient.update("User", user.toMap(),
    //     where: "id = ?", whereArgs: <int>[user.id]);
    // return res > 0 ? true : false;
  }
}