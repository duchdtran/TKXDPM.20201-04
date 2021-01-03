import 'dart:convert';

import '../../utils/api.dart';

class Bike {
  static const SINGLE_BIKE = 1;
  static const DOUBLE_BIKE = 2;
  static const ELECTRIC_BIKE = 3;

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
    this.isRented,
  });

  Bike.fromJson(Map<String, dynamic> json) {
    id = json['bikeId'];
    bikeName = json['bikeName'];
    description = json['description'];
    costStartingRent = json['startingRent'];
    costHourlyRent = json['hourlyRent'];
    bikeType = json['type'];
    images = [json['bikeImage']];
    licensePlates = json['licensePlates'];
    deposits = json['deposit'];
    isRented = json['isRented'];
  }

  Map<String, dynamic> toJson() {
    final  data =  <String, dynamic>{};
    data['bikeId'] = id;
    data['bikeName'] = bikeName;
    data['description'] = description;
    data['startingRent'] = costStartingRent;
    data['hourlyRent'] = costHourlyRent;
    data['bikeImage'] = images[0];
    data['type'] = bikeType;
    data['licensePlates'] = licensePlates;
    data['deposit'] = deposits;
    data['isRented'] = isRented;
    return data;
  }

  int id;
  String bikeName;
  String description;
  double size;
  List<String> images;
  int costStartingRent;
  int costHourlyRent;
  int bikeType;
  String licensePlates;
  int deposits;
  bool isRented;

  Future<Bike> getBike(int bikeId) async {
    Bike bike;
    final url = 'https://tkxdpm-server.herokuapp.com/api/get-bike?bikeId=${bikeId}';
    final response = await API.get(url);
      bike = Bike.fromJson(json.decode(response));
    return Future.value(bike);
  }
}
