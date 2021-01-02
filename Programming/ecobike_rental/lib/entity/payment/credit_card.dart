class CreditCard {
  CreditCard(
    this._cardCode,
    this._owner,
    this._cvvCode,
    this._dateExpired,
  );

  CreditCard.fromJson(Map<String, dynamic> json) {
    _cardCode = json['cardCode'];
    _owner = json['owner'];
    _cvvCode = int.parse(json['cvvCode']);
    _dateExpired = int.parse(json['dateExpired']);
  }

  Map<String, dynamic> toJson(){
    final json = <String, dynamic>{};
    json['owner'] = _owner;
    json['cvvCode'] = _cvvCode.toString();
    json['cardCode'] = _cardCode;
    json['dateExpired'] = _dateExpired.toString();
    return json;
  }

  String _cardCode;
  String _owner;
  int _cvvCode;
  int _dateExpired;

  String get cardCode {
    return _cardCode;
  }
}
