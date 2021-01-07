import 'dart:convert';

import 'package:ecobike_rental/utils/config.dart';

import '../../utils/api.dart';
import '../bike/bike.dart';

class Rental {
  Future<Bike> checkRentBike(String deviceCode) async {
    final url =
        '${Configs.BASE_URL}check-rent-bike?deviceCode=$deviceCode';
    Bike bike;
    final response = await API.post(url);
    bike = Bike.fromJson(json.decode(response));

    return Future.value(bike);
  }

  Future rentBike(String deviceCode, int bikeId, int deposit) async {
    final url =
        '${Configs.BASE_URL}rent-bike?deviceCode=$deviceCode&bikeId=$bikeId&deposit=$deposit';
    await API.post(url);
  }

  Future returnBike(String deviceCode, int stationId, int bikeId) async {
    final url =
        '${Configs.BASE_URL}return-bike?deviceCode=$deviceCode&stationId=$stationId&bikeId=$bikeId';
    await API.post(url);
  }
}
