import 'package:equatable/equatable.dart';

import 'cores.dart';

const String tableStation = 'station';

class Station extends Equatable {
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
  int area;
  String contactName;
  List<Bike> bikes;

  @override
  List<Object> get props => [id];

  static Station fromJson(Map<String, dynamic> json) {
    return Station.empty()
      ..contactName = json['contactName']
      ..email = json['email']
      ..phone = json['phone']
      ..area = json['area']
      ..stationName = json['stationName'];
    //..address = json['address']?.map(Address.fromJson);
    //..bikes = json['bikes']?.map(Bike.fromJson)
    //;
  }
}
