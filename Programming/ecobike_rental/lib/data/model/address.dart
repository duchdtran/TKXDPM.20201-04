import 'package:equatable/equatable.dart';

import '../db/database.dart';

class Address extends Equatable implements Model {
  Address({this.id, this.name, this.longitude, this.latitude});

  Address.empty();

  Address.fromMap(Map<String, dynamic> map) {
    id = map[Address.key];
    name = map["address_name"];
    longitude = map["longitude"];
    latitude = map["latitude"];
  }

  static String tableName = "Address";
  static String key = "address_id";

  int id;
  String name;
  double longitude;
  double latitude;

  @override
  List<Object> get props => [id];

  static Address fromJson(Map<String, dynamic> json) {
    return Address.empty()
      ..id = json['id']
      ..latitude = json['latitude']
      ..longitude = json['longitude'];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      Address.key: id,
      'address_name': name,
      'longitude': longitude,
      'latitude': latitude
    };
  }


  @override
  String getTableName() {
    return Address.tableName;
  }
}
