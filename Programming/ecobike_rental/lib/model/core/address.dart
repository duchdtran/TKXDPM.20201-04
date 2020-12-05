import 'package:equatable/equatable.dart';

class Address extends Equatable{
  Address(this.id, this.longitude, this.latitude);
  Address.empty();

  int id;
  double longitude;
  double latitude;

  @override
  List<Object> get props => [id];

  static Address fromJson(Map<String, dynamic> json){
    return Address.empty()
        ..id = json['id']
        ..latitude = json['latitude']
        ..longitude = json['longitude'];
  }
}