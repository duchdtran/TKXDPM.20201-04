import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;

import 'request/input_encoding.dart';
import 'request/process_transaction.dart';
import 'request/transaction.dart';

class PaymentApi {
  Future<String> processTransaction(TransactionRequest transaction) async {
    final md5 = generateMd5(InputEncoding(
      secretKey: 'BcvsSCIF4ho=',
      transaction: transaction,
    ).toString());

    final reseponse = json.encode(
      ProcessTransactionRequest(
        hashCode1: md5,
        appCode: "AnUHgieijc4=",
        version: "1.0.1",
        transaction: transaction,
      ).toJson(),
    );
    final response = await http.patch(
      'https://ecopark-system-api.herokuapp.com/api/card/processTransaction',
      body: reseponse,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
      //return InputEncoding.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  String generateMd5(String data) {
    final content = const Utf8Encoder().convert(data);
    final md5 = crypto.md5;
    final digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}