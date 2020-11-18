import 'address.dart';

import 'bike.dart';

class Station {
  Station({
    this.stationId,
    this.stationName,
    this.address,
    this.email,
    this.phone,
    this.area,
    this.contactName,
    this.singleBikes,
    this.doubleBikes,
    this.electricBikes,
  });

  int stationId;
  String stationName;
  Address address;
  String email;
  String phone;
  double area;
  String contactName;
  List<Bike> singleBikes;
  List<Bike> doubleBikes;
  List<Bike> electricBikes;
}
