import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class PaymentApi {
  Future<String> processTransaction() async {
    

    final request = json.encode(
      ResetBalanceRequest(
        owner: "Group 4",
        cvvCode: "228",
        dateExpired: "1125",
        cardCode: "118609_group4_2020", 
      ).toJson(),
    );
    final response = await http.patch(
      'https://ecopark-system-api.herokuapp.com/api/card/reset-balance',
      body: request,
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

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: PaymentApi().processTransaction(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const Text('Reset tài khoản thành công');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}


class ResetBalanceRequest {
  ResetBalanceRequest(
      {this.owner, this.cvvCode, this.dateExpired, this.cardCode});

  ResetBalanceRequest.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    cvvCode = json['cvvCode'];
    dateExpired = json['dateExpired'];
    cardCode = json['cardCode'];
  }

  String owner;
  String cvvCode;
  String dateExpired;
  String cardCode;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['owner'] = owner;
    data['cvvCode'] = cvvCode;
    data['dateExpired'] = dateExpired;
    data['cardCode'] = cardCode;
    return data;
  }
}