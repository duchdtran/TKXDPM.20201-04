import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/cores.dart';
import 'response/station.dart';

class StattionApi {
  Future<List<StationResponse>> getListStation() async {
    List<StationResponse> listStation;
    final response = await http
        .get('https://tkxdpm-server.herokuapp.com/api/get-list-stations');
    if (response.statusCode == 200) {
      listStation = (json.decode(response.body) as List)
          .map((i) => StationResponse.fromJson(i))
          .toList();
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
    return listStation;
  }
}
