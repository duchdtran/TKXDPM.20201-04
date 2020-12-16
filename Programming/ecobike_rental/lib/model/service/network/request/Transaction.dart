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
