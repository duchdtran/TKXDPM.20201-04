class Transaction {
  Transaction({
    this.actualEndDateTime,
    this.actualStartDateTime,
    this.bookedEndDateTime,
    this.bookedStartDateTime,
    this.paymentStutus,
  });

  bool paymentStutus;
  String bookedStartDateTime;
  String bookedEndDateTime;
  String actualStartDateTime;
  String actualEndDateTime;
}
