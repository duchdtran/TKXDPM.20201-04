class PaymentException implements Exception {
  PaymentException([this._message = '', this._prefix]);

  final _message;
  final _prefix;

  @override
  String toString() {
    return '$_prefix$_message';
  }
}
