import 'package:http/http.dart' as http;

import 'response/process_transaction.dart';

class ApiHelper{
  static const  String baseURL = 'http://ecopark-system-api.herokuapp.com';
  Future<ProcessTransactionResponse> processTransaction() async {
    final response = await http.patch('$baseURL/api/card/processTransaction');

    if (response.statusCode == 200) {
      //return ProcessTransactionResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
  Future<ProcessTransactionResponse> resetBalance() async {
    final response = await http.patch('$baseURL/api/card/processTransaction');

    if (response.statusCode == 200) {
      //return ProcessTransactionResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

}