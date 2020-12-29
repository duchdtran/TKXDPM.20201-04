import 'transaction.dart';

class InputEncoding {
  
  InputEncoding({this.secretKey, this.transaction});

  InputEncoding.fromJson(Map<String, dynamic> json) {
    secretKey = json['secretKey'];
    transaction = json['transaction'] != null
        ? TransactionRequest.fromJson(json['transaction'])
        : null;
  }
  
  String secretKey;
  TransactionRequest transaction;


  Map<String, dynamic> toJson() {
    final data =  <String, dynamic>{};
    var s = data['secretKey'] = secretKey;
    if (transaction != null) {
      final map = data['transaction'] = transaction.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return '{"secretKey":"$secretKey","transaction":${transaction.toString()}}';
  }
}