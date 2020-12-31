import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'response/responses.dart';

class BikeApi {
  Future<BikeResponse> getBike(int bikeId) async {
    BikeResponse bike;
    final response = await http.get(
        'https://tkxdpm-server.herokuapp.com/api/get-bike?bikeId=${bikeId}');
    if (response.statusCode == 200) {
      bike = BikeResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
    return bike;
  }


}
