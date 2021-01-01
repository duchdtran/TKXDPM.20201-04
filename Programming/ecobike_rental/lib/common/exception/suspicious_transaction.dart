import 'payment.dart';

class SuspiciousTransactionException extends PaymentException{
  SuspiciousTransactionException([String message])
      : super(message, "Suspicious Transaction Exception: ");
}