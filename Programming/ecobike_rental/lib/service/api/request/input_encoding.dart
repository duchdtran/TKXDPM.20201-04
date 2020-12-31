import 'transaction.dart';

class InputEncoding {
  String secretKey;
  TransactionRequest transaction;

  InputEncoding({this.secretKey, this.transaction});

  InputEncoding.fromJson(Map<String, dynamic> json) {
    secretKey = json['secretKey'];
    transaction = json['transaction'] != null
        ? new TransactionRequest.fromJson(json['transaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secretKey'] = this.secretKey;
    if (this.transaction != null) {
      data['transaction'] = transaction.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return '{"secretKey":"$secretKey","transaction":${transaction.toString()}}';
  }
}