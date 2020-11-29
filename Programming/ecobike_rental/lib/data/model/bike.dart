import 'package:equatable/equatable.dart';

import '../db/database.dart';

class Bike extends Equatable implements Model {
  Bike({
    this.id,
    this.bikeName,
    this.description,
    this.size,
    this.images,
    this.costStartingRent,
    this.costHourlyRent,
    this.bikeType,
    this.licensePlates,
    this.deposits,
  });

  Bike.empty();

  Bike.fromMap(Map<String, dynamic> map) {
    id = map[Bike.tableName];
    bikeName = map["bike_name"];
    description = map["description"];
    costStartingRent = map["starting_rent"];
    costHourlyRent = map["hourly_rent"];
    bikeType = map["bike_type"];
    licensePlates = map["license_plates"];
    deposits = map["deposits"];
  }

  static String tableName = "Bike";
  static String key = "bike_id";
  int id;
  String bikeName;
  String description;
  double size;
  List<String> images;
  int costStartingRent;
  int costHourlyRent;
  BikeType bikeType;
  String licensePlates;
  int deposits;

  @override
  List<Object> get props => [id];

  static Bike fromJson(Map<String, dynamic> json) {
    return Bike.empty()
      ..bikeName = json['']
      ..bikeType = json['']
      ..bikeName = json['']
      ..bikeName = json['']
      ..bikeName = json['']
      ..bikeName = json['']
      ..bikeName = json[''];
  }

  @override
  String getTableName() {
    return Bike.tableName;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      Bike.tableName: id,
      'bike_name': bikeName,
      'description': description,
      'starting_rent': costStartingRent,
      'hourly_rent': costHourlyRent,
      'bike_type': bikeType,
      'license_plates': licensePlates,
      'deposits': deposits
    };
  }

  static Future<List<Bike>> getListBikeInStation(int stationId) async {
    final list = <Bike>[];

    return list;
  }


}

enum BikeType { singleBike, doubleBike, electricBike }
