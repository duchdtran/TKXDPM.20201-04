import 'package:ecobike_rental/data/db/database.dart';
import 'package:equatable/equatable.dart';

class Bike extends Equatable implements Model {
  static String tableName = "Bike";
  static String key = "bike_id";

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
    var list = new List<Bike>();

    return list;
  }

  static Bike fromMap(Map<String, dynamic> map) {
    return Bike(
      id: map[Bike.tableName],
      bikeName: map["bike_name"],
      description: map["description"],
      costStartingRent: map["starting_rent"],
      costHourlyRent: map["hourly_rent"],
      bikeType: map["bike_type"],
      licensePlates: map["license_plates"],
      deposits: map["deposits"],
    );
  }
}

enum BikeType { singleBike, doubleBike, electricBike }
