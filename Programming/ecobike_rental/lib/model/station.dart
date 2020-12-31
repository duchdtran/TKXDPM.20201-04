import 'address.dart';
import 'bike.dart';

const String tableStation = 'station';

class Station {
  Station({
    this.id,
    this.stationName,
    this.address,
    this.email,
    this.phone,
    this.image,
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
  String image;
  int area;
  String contactName;
  List<Bike> bikes;
}
