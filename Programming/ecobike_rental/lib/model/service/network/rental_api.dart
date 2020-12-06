import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

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
}
