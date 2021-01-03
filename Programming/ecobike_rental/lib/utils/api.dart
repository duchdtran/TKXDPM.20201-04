import 'package:http/http.dart' as http;

import '../common/exception/unrecognized.dart';

class API {
  static Future<String> get(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Future.value(response.body);
    } else {
      return Future.error(UnrecognizedException());
    }
  }

  static Future<String> post(String url) async {
    final response = await http.post(url);
    if (response.statusCode == 200) {
      return Future.value(response.body);
    } else {
      return Future.error(UnrecognizedException());
    }
  }

  static Future<String> patch(String url, String data) async {
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.patch(
      url,
      body: data,
      headers: header,
    );
    if (response.statusCode == 200) {
      return Future.value(response.body);
    } else {
      return Future.error(UnrecognizedException());
    }
  }
}
