import 'payment.dart';

class InvalidCardException extends PaymentException{
  InvalidCardException([String message])
      : super(message, "Invalid Card Exception: ");
}