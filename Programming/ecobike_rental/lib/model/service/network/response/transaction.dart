class TransactionResponse {
  int transactionId;
  bool rental;
  bool paymentStatus;
  String bookedStartDateTime;
  String bookedEndDateTime;
  String actualStartDateTime;
  String actualEndDateTime;

  TransactionResponse(
      {this.transactionId,
      this.rental,
      this.paymentStatus,
      this.bookedStartDateTime,
      this.bookedEndDateTime,
      this.actualStartDateTime,
      this.actualEndDateTime});

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    rental = json['rental'];
    paymentStatus = json['paymentStatus'];
    bookedStartDateTime = json['bookedStartDateTime'];
    bookedEndDateTime = json['bookedEndDateTime'];
    actualStartDateTime = json['actualStartDateTime'];
    actualEndDateTime = json['actualEndDateTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['rental'] = rental;
    data['paymentStatus'] = paymentStatus;
    data['bookedStartDateTime'] = bookedStartDateTime;
    data['bookedEndDateTime'] = bookedEndDateTime;
    data['actualStartDateTime'] = actualStartDateTime;
    data['actualEndDateTime'] = actualEndDateTime;
    return data;
  }
}
