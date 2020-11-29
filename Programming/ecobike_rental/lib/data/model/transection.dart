import 'package:equatable/equatable.dart';
import '../db/database.dart';

class Transection extends Equatable implements Model {
  Transection({this.id, this.name, this.longitude, this.latitude});

  Transection.empty();

  Transection.fromMap(Map<String, dynamic> map) {
    id = map[Transection.key];
    name = map["address_name"];
    longitude = map["longitude"];
    latitude = map["latitude"];
  }

  static String tableName = "Transection";
  static String key = "transection_id";
  int id;
  String name;
  double longitude;
  double latitude;

  @override
  List<Object> get props => [id];

  static Transection fromJson(Map<String, dynamic> json) {
    return Transection.empty()
      ..id = json['id']
      ..latitude = json['latitude']
      ..longitude = json['longitude'];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      Transection.key: id,
      'address_name': name,
      'longitude': longitude,
      'latitude': latitude
    };
  }

  @override
  String getTableName() {
    return Transection.tableName;
  }
}
