import 'package:ecobike_rental/data/db/database.dart';
import 'package:equatable/equatable.dart';

class Address extends Equatable implements Model {
  static String tableName = "Address";
  static String key = "address_id";

  Address({this.id, this.name, this.longitude, this.latitude});

  Address.empty();

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

  static Address fromMap(Map<String, dynamic> map) {
    return Address(
        id: map[Address.key],
        name: map["address_name"],
        longitude: map["longitude"],
        latitude: map["latitude"]);
  }

  @override
  String getTableName() {
    return Address.tableName;
  }
}
