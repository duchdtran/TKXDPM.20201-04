import 'payment.dart';

class SuspiciousTransactionException extends PaymentException{
  SuspiciousTransactionException()
      : super("Giao dịch bị nghi ngờ gian lận");
}