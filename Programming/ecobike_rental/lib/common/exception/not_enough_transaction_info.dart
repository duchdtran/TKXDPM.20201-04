import 'payment.dart';

class NotEnoughTransactionInfoException extends PaymentException{
  NotEnoughTransactionInfoException([String message])
      : super(message, "Not Enough Transaction Info Exception: ");
}