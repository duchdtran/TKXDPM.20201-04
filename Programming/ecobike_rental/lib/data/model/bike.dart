import 'station.dart';

class Bike{
  int bikeId;
  String bikeName;
  String description;
  double size;
  int costStartingRent;
  int costHourlyRent;
  BikeType bikeType;
  String licensePlates;
  int batteryCapacity;
  double powerDrain;
  int deposits;
  Station station;
}

enum BikeType{
  singleBike,
  doubleBike,
  electricBike
}