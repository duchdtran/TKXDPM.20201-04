import 'package:ecobike_rental/data/db/database.dart';
import 'package:equatable/equatable.dart';

import 'models.dart';

const String tableStation = 'station';

class Station extends Equatable implements Model {
  static String tableName = "Station";
  static String key = "station_id";

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
    return await DatabaseImp.insert(this);
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

  static Station fromMap(Map<String, dynamic> map) {
    return Station(
        id: map[Station.key],
        stationName: map["station_name"],
        contactName: map["contact_name"],
        email: map["email"],
        phone: map["phone"],
        area: map["area"]);
  }

  static Future<List<Station>> getListStation() async {
    var maps = await DatabaseImp.getModels(Station.tableName);
    var lists = new List<Station>();
    for (var i = 0; i < maps.length; i++) {
      var station = Station.fromMap(maps[i]);
      var addressMap = await DatabaseImp.getModel(
          Address.tableName, maps[i]["address_id"], Address.key);
      var address = Address.fromMap(addressMap);
      station.address = address;
      station.bikes = await Bike.getListBikeInStation(station.id);
      lists.add(station);
    }
    return lists;
  }

  static Future<Station> getStation(int stationId) async {
    var map =
        await DatabaseImp.getModel(Station.tableName, stationId, Station.key);
    var station = Station.fromMap(map);
    var addressMap = await DatabaseImp.getModel(
        Address.tableName, map["address_id"], Address.key);
    var address = Address.fromMap(addressMap);
    station.address = address;
    station.bikes = await Bike.getListBikeInStation(station.id);
    return station;
  }
}
