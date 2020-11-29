import 'package:equatable/equatable.dart';

import '../db/database.dart';

class Renter extends Equatable implements Model {
  Renter({this.id, this.name});

  Renter.empty();

  Renter.fromMap(Map<String, dynamic> map) {
    id = map[Renter.key];
    name = map["renter_name"];
  }

  static String tableName = "Renter";
  static String key = "renter_id";

  int id;
  String name;

  @override
  List<Object> get props => [id];

  @override
  Map<String, dynamic> toMap() {
    return {
      Renter.key: id,
      'renter_name': name,
    };
  }

  @override
  String getTableName() {
    return Renter.tableName;
  }
}
