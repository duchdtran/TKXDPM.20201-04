class CardInfo {
  CardInfo({
    this.cardCode,
    this.owner,
    this.cvvCode,
    this.dateExpired,
    this.paymentMethod,
  });

  String paymentMethod;
  String cardCode;
  String owner;
  int cvvCode;
  String dateExpired;
}
