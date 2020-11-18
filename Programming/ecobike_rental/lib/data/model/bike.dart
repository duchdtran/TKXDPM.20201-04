import 'station.dart';

class Bike {
  Bike({
    this.bikeId,
    this.bikeName,
    this.description,
    this.size,
    this.images,
    this.costStartingRent,
    this.costHourlyRent,
    this.bikeType,
    this.licensePlates,
    this.batteryCapacity,
    this.powerDrain,
    this.deposits,
    this.station,
  });

  int bikeId;
  String bikeName;
  String description;
  double size;
  List<String> images;
  int costStartingRent;
  int costHourlyRent;
  BikeType bikeType;
  String licensePlates;
  int batteryCapacity;
  double powerDrain;
  int deposits;
  Station station;
}

enum BikeType { singleBike, doubleBike, electricBike }
