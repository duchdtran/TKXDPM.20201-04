import 'package:equatable/equatable.dart';

import 'models.dart';

const String tableStation =  'station';

class Station extends Equatable{
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

  @override
  List<Object> get props => [id];


  static Station fromJson(Map<String, dynamic> json){
    return Station.empty()
      ..id = json['id']
      ..contactName = json['contact_name']
      ..area = json['area']
      ..phone = json['phone']
      ..address = json['address']?.map(Address.fromJson)
      ..bikes = json['bikes']?.map(Bike.fromJson)
      ..email = json['email']
      ..stationName = json['station_name'];
  }
}
