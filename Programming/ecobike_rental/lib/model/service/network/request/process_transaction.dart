import 'Transaction.dart';

class ProcessTransactionRequest {
  String hashCode1;
  String appCode;
  String version;
  Transaction transaction;

  ProcessTransactionRequest(
      {this.hashCode1, this.appCode, this.version, this.transaction});

  ProcessTransactionRequest.fromJson(Map<String, dynamic> json) {
    hashCode1 = json['hashCode'];
    appCode = json['appCode'];
    version = json['version'];
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hashCode'] = this.hashCode;
    data['appCode'] = this.appCode;
    data['version'] = this.version;
    if (this.transaction != null) {
      data['transaction'] = this.transaction.toJson();
    }
    return data;
  }
}