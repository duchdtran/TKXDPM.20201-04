import 'payment.dart';

class InvalidTransactionAmountException extends PaymentException{
  InvalidTransactionAmountException([String message])
      : super(message, "Invalid Transaction Amount Exception: ");
}