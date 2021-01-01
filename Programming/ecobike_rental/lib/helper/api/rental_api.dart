import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/bike.dart';
import '../../model/invoice.dart';
import '../util/converter.dart';
import 'response/responses.dart';

class RentalApi {

  Future<Bike> checkRentBike(String deviceCode) async {
    Bike bike;
    final response = await http.post(
        'https://tkxdpm-server.herokuapp.com/api/check-rent-bike?deviceCode=$deviceCode');
    if (response.statusCode == 200) {
      bike = Converter.convertBikeResponse(BikeResponse.fromJson(json.decode(response.body)));
    } else {
      return null;
      //throw Exception('Unable to fetch products from the REST API');
    }
    return bike;
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

  Future<Invoice> getInvoice(String deviceCode, int bikeId) async{
    int totalTime;
    int fee;
    final response = await http.get(
        'https://tkxdpm-server.herokuapp.com/api/get-invoice?deviceCode=$deviceCode&bikeId=$bikeId');
    if (response.statusCode == 200) {
      totalTime = json.decode(response.body)['minutes'];
      fee = json.decode(response.body)['fee'];
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }

    return Future.value(new Invoice(fee, totalTime));
  }
}
