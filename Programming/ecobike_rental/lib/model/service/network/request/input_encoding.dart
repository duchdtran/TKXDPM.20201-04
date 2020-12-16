import 'Transaction.dart';

class InputEncoding {
  String secretKey;
  Transaction transaction;

  InputEncoding({this.secretKey, this.transaction});

  InputEncoding.fromJson(Map<String, dynamic> json) {
    secretKey = json['secretKey'];
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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