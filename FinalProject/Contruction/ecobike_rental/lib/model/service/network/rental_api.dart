import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

import 'response/responses.dart';

class RentalApi {
  Future<RentalResponse> getRentalInfo(String deviceCode) async {
    RentalResponse rental;
    final response = await http.get(
        'https://tkxdpm-server.herokuapp.com/api/get-rental-info?deviceCode=$deviceCode');
    if (response.statusCode == 200) {
      rental = RentalResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
    return rental;
  }

  Future<BikeResponse> checkRentBike(String deviceCode) async {
    BikeResponse rental;
    final response = await http.post(
        'https://tkxdpm-server.herokuapp.com/api/check-rent-bike?deviceCode=$deviceCode');
    if (response.statusCode == 200) {
      rental = BikeResponse.fromJson(json.decode(response.body));
    } else {
      return null;
      //throw Exception('Unable to fetch products from the REST API');
    }
    return rental;
  }

  Future<bool> rentBike(String deviceCode, int bikeId, int deposit) async {
    final response = await http.post(
        'https://tkxdpm-server.herokuapp.com/api/rent-bike?deviceCode=$deviceCode&bikeId=$bikeId&deposit=$deposit');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
      //throw Exception('Unable to fetch products from the REST API');
    }
  }

  Future<int> returnBike(String deviceCode, int stationId, int bikeId) async {
    int deposit;
    final response = await http.post(
        'https://tkxdpm-server.herokuapp.com/api/return-bike?deviceCode=$deviceCode&stationId=$stationId&bikeId=$bikeId');
    if (response.statusCode == 200) {
      deposit = json.decode(response.body)['returnMoney'];
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
    return deposit;
  }

  Future<Tuple2<int, int>> getInvoice(String deviceCode, int bikeId) async{
    int totalTime;
    int returnMoney;
    final response = await http.get(
        'https://tkxdpm-server.herokuapp.com/api/get-invoice?deviceCode=$deviceCode&bikeId=$bikeId');
    if (response.statusCode == 200) {
      totalTime = json.decode(response.body)['minutes'];
      returnMoney = json.decode(response.body)['fee'];
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
    return Future.value(Tuple2(totalTime, returnMoney));
  }
}
