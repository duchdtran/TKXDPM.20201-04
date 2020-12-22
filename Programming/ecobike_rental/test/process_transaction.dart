import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

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
    final transaction = Transaction(
      owner: 'Group 4',
      createdAt: '2020-11-12 10:55:26',
      amount: 2000,
      cvvCode: '228',
      dateExpired: '1125',
      cardCode: '118609_group4_2020',
      transactionContent: 'Thanh toan aahh',
      command: 'pay',
    );
    final String md5 = generateMd5(InputEncoding(
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

  generateMd5(String data) {
    print(data);
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
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
            if (snapshot.connectionState == ConnectionState.done)
              return Text("Square = ${snapshot.data}");

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class ProcessTransactionRequest {
  ProcessTransactionRequest(
      {this.hashCode1, this.appCode, this.version, this.transaction});

  ProcessTransactionRequest.fromJson(Map<String, dynamic> json) {
    hashCode1 = json['hashCode'];
    appCode = json['appCode'];
    version = json['version'];
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
  }

  String hashCode1;
  String appCode;
  String version;
  Transaction transaction;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hashCode'] = hashCode;
    data['appCode'] = appCode;
    data['version'] = version;
    if (transaction != null) {
      data['transaction'] = transaction.toJson();
    }
    return data;
  }
}

class InputEncoding {
  String secretKey;
  Transaction transaction;

  InputEncoding({this.secretKey, this.transaction});

  InputEncoding.fromJson(Map<String, dynamic> json) {
    secretKey = json['secretKey'];
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = new Map<String, dynamic>();
    var s = data['secretKey'] = this.secretKey;
    if (this.transaction != null) {
      var map = data['transaction'] = transaction.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return '{"secretKey":"$secretKey","transaction":${transaction.toString()}}';
  }
}

class Transaction {
  String owner;
  String createdAt;
  int amount;
  String cvvCode;
  String dateExpired;
  String cardCode;
  String transactionContent;
  String command;

  Transaction(
      {this.owner,
      this.createdAt,
      this.amount,
      this.cvvCode,
      this.dateExpired,
      this.cardCode,
      this.transactionContent,
      this.command});

  Transaction.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    createdAt = json['createdAt'];
    amount = json['amount'];
    cvvCode = json['cvvCode'];
    dateExpired = json['dateExpired'];
    cardCode = json['cardCode'];
    transactionContent = json['transactionContent'];
    command = json['command'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['owner'] = this.owner;
    data['createdAt'] = this.createdAt;
    data['amount'] = this.amount;
    data['cvvCode'] = this.cvvCode;
    data['dateExpired'] = this.dateExpired;
    data['cardCode'] = this.cardCode;
    data['transactionContent'] = this.transactionContent;
    data['command'] = this.command;
    return data;
  }

  @override
  String toString() {
    return '{"owner":"$owner","createdAt":"$createdAt","amount":$amount,"cvvCode":"$cvvCode","dateExpired":"$dateExpired","cardCode":"$cardCode","transactionContent":"$transactionContent","command":"$command"}';
  }
}
