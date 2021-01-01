import 'payment.dart';

class InvalidVersionException extends PaymentException{
  InvalidVersionException([String message])
      : super(message, "Invalid Version Exception: ");
}