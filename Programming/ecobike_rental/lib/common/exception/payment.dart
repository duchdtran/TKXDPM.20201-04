class PaymentException implements Exception {
  PaymentException([this._message = '']);

  final _message;

  @override
  String toString() {
    return _message;
  }
}
