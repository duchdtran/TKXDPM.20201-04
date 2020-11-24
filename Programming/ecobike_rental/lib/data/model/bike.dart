import 'package:equatable/equatable.dart';

class Bike extends Equatable{


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

  static Bike fromJson(Map<String, dynamic> json){
    return Bike.empty()
        ..bikeName = json['']
        ..bikeType = json['']
        ..bikeName = json['']
        ..bikeName = json['']
        ..bikeName = json['']
        ..bikeName = json['']
        ..bikeName = json[''];
  }
}

enum BikeType { singleBike, doubleBike, electricBike }
