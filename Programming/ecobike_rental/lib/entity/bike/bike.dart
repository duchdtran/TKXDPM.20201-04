import 'dart:convert';

import 'package:ecobike_rental/entity/bike/bike_mapper.dart';
import 'package:ecobike_rental/utils/config.dart';

import '../../utils/api.dart';
import 'double_bike.dart';
import 'electric_bike.dart';
import 'single_bike.dart';

/// Lớp bike chung, các lớp bike khác kế thừa lớp này
class Bike {


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


  /// [Contructor] Khởi tạo Bike
  ///
  /// Tạo các instance là các lớp con của Bike dựa vào loại xe
  factory Bike.fromJson(Map<String, dynamic> json) {
    return BikeMapper.map[json['type']](json);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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


  /// Lấy thông tin xe theo id
  /// @param bikeId 
  Future<Bike> getBike(int bikeId) async {
    Bike bike;
    final url =
        '${Configs.BASE_URL}get-bike?bikeId=${bikeId}';
    final response = await API.get(url);
    bike = Bike.fromJson(json.decode(response));
    return Future.value(bike);
  }
}
