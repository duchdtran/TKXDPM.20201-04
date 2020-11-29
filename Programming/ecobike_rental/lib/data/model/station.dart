import 'package:equatable/equatable.dart';

import '../db/database.dart';
import 'models.dart';

const String tableStation = 'station';

class Station extends Equatable implements Model {
  Station({
    this.id,
    this.stationName,
    this.address,
    this.email,
    this.phone,
    this.area,
    this.contactName,
    this.bikes,
  });

  Station.empty();

  Station.fromMap(Map<String, dynamic> map) {
    id = map[Station.key];
    stationName = map["station_name"];
    contactName = map["contact_name"];
    email = map["email"];
    phone = map["phone"];
    area = map["area"];
  }

  static String tableName = "Station";
  static String key = "station_id";
  int id;
  String stationName;
  Address address;
  int addressId;
  String email;
  String phone;
  double area;
  String contactName;
  List<Bike> bikes;

  @override
  List<Object> get props => [id];

  static Station fromJson(Map<String, dynamic> json) {
    return Station.empty()
      ..id = json['id']
      ..contactName = json['contact_name']
      ..area = json['area']
      ..phone = json['phone']
      ..address = json['address']?.map(Address.fromJson)
      ..bikes = json['bikes']?.map(Bike.fromJson)
      ..email = json['email']
      ..stationName = json['station_name'];
  }

  @override
  String getTableName() {
    return Station.tableName;
  }

  Future save() async {
    return DatabaseImp.insert(this);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      Station.key: id,
      'station_name': stationName,
      'contact_name': contactName,
      'address_id': addressId,
      'email': email,
      'phone': phone,
      'area': area
    };
  }

  static Future<List<Station>> getListStation() async {
    final maps = await DatabaseImp.getModels(Station.tableName);
    final lists = <Station>[];
    for (var i = 0; i < maps.length; i++) {
      final station = Station.fromMap(maps[i]);
      final addressMap = await DatabaseImp.getModel(
          Address.tableName, maps[i]["address_id"], Address.key);
      final address = Address.fromMap(addressMap);
      station.address = address;
      station.bikes = await Bike.getListBikeInStation(station.id);
      lists.add(station);
    }
    return lists;
  }

  static Future<Station> getStation(int stationId) async {
    final map =
        await DatabaseImp.getModel(Station.tableName, stationId, Station.key);
    final station = Station.fromMap(map);
    final addressMap = await DatabaseImp.getModel(
        Address.tableName, map["address_id"], Address.key);
    final address = Address.fromMap(addressMap);
    station.address = address;
    station.bikes = await Bike.getListBikeInStation(station.id);
    return station;
  }
}
