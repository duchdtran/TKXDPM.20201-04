import 'package:ecobike_rental/data/database.dart';

import 'address.dart';

class Station extends Model {
  static String tableName = "station";
  static String key = "stationId";

  Station(
      {this.stationId,
      this.stationName,
      this.address,
      this.emailAddress,
      this.phoneNumber,
      this.area});

  Station.fromMap(Map<String, dynamic> map) {
    stationId = map["stationId"];
    stationName = map["stationName"];
    emailAddress = map["emailAddress"];
    phoneNumber = map["phoneNumber"];
    area = map["area"];
    addressId = map["addressId"];
  }

  int stationId;
  String stationName;
  Address address;
  int addressId;
  String emailAddress;
  String phoneNumber;
  double area;

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
      'stationId': stationId,
      'stationName': stationName,
      'addressId': addressId,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'area': area
    };
  }

  static Future<List<Station>> getStations() async {
    var maps = await DatabaseImp.getModels(Station.tableName);
    return List.generate(maps.length, (i) {
      return Station.fromMap(maps[i]);
    });
  }

  static Future<Station> getStation(int id) async {
    var map = await DatabaseImp.getModel(Station.tableName, id, Station.key);
    return Station.fromMap(map);
  }
}
