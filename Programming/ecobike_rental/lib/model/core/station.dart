import 'cores.dart';

const String tableStation = 'station';

class Station {
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
  String email;
  String phone;
  double area;
  String contactName;
  List<Bike> bikes;
}
