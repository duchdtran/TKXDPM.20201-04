import 'credit_card.dart';

class PaymentTransaction {
  PaymentTransaction(this._card, this._transactionId, this._transactionContent,
      this._amount, this._createdAt);

  PaymentTransaction.fromJson(Map<String, dynamic> json) {
    _card = CreditCard.fromJson(json);
    _transactionId = json['transactionId'];
    _transactionContent = json['transactionContent'];
    _amount = json['amount'];
    _createdAt = json['createdAt'];
    _command = json['command'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    _card.toJson().forEach((key, value) => json[key] = value);
    json['transactionId'] = _transactionId;
    json['transactionContent'] = _transactionContent;
    json['amount'] = _amount;
    json['createdAt'] = _createdAt;
    json['command'] = _command;
    return json;
  }

  CreditCard _card;
  String _transactionId;
  String _transactionContent;
  int _amount;
  String _createdAt;
  String _command;
}
