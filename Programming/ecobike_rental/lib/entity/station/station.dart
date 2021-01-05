import 'dart:convert';

import 'package:ecobike_rental/entity/renter/renter.dart';
import 'package:ecobike_rental/utils/config.dart';

import '../../utils/api.dart';
import '../bike/bike.dart';
import '../address/address.dart';

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

  Station.fromJson(Map<String, dynamic> json) {
    id = json['stationId'];
    stationName = json['stationName'];
    image = json['stationImage'];
    contactName = json['contactName'];
    email = json['email'];
    phone = json['phone'];
    area = json['area'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['listBike'] != null) {
      bikes = <Bike>[];
      json['listBike'].forEach((v) {
        bikes.add(Bike.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['stationId'] = id;
    data['stationName'] = stationName;
    data['stationImage'] = image;
    data['contactName'] = contactName;
    data['email'] = email;
    data['phone'] = phone;
    data['area'] = area;
    if (address != null) {
      data['address'] = address.toJson();
    }
    if (bikes != null) {
      data['listBike'] = bikes.map((v) => v.toJson()).toList();
    }
    return data;
  }

  int id;
  String stationName;
  Address address;
  String email;
  String phone;
  String image;
  int area;
  String contactName;
  List<Bike> bikes;

  Future<List<Station>> getListStation() async {
    List<Station> listStation;
    const url = '${Configs.BASE_URL}get-list-stations';
    final response = await API.get(url);
    listStation = (json.decode(response) as List).map((i) => Station.fromJson(i)).toList();
    return Future.value(listStation);
  }

  Future<Station> getStation(int stationId) async {
    Station station;
    final url =
        '${Configs.BASE_URL}get-station?id=$stationId';
    final response = await API.get(url);
    station = Station.fromJson(json.decode(response));

    return Future.value(station);
  }

  ///Lấy danh sách xe theo loại
  ///@bikeType loại xe
  ///@return Danh sách các xe trong trạm theo loại
  List<Bike> getListBikeByType(int bikeType) {
    final listBike = <Bike>[];
    for (var i = 0; i < bikes.length; i++) {
      if (bikes[i].bikeType == bikeType) {
        listBike.add(bikes[i]);
      }
    }
    return listBike;
  }

  /// Tính khoảng cách của người dùng và trạm xe
  double calculateDistanceRenter(){
    final  distance = Address.calculateDistance(Renter().address, address);
    /// TODO
    return distance;
  }
}
