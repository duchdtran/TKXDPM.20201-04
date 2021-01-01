import 'transaction.dart';

class ProcessTransactionRequest {
  String hashCode1;
  String appCode;
  String version;
  TransactionRequest transaction;

  ProcessTransactionRequest(
      {this.hashCode1, this.appCode, this.version, this.transaction});

  ProcessTransactionRequest.fromJson(Map<String, dynamic> json) {
    hashCode1 = json['hashCode'];
    appCode = json['appCode'];
    version = json['version'];
    transaction = json['transaction'] != null
        ?  TransactionRequest.fromJson(json['transaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data =  <String, dynamic>{};
    data['hashCode'] = this.hashCode;
    data['appCode'] = this.appCode;
    data['version'] = version;
    if (this.transaction != null) {
      data['transaction'] = this.transaction.toJson();
    }
    return data;
  }
}