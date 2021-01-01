import 'payment.dart';

class NotEnoughBalanceException extends PaymentException{
  NotEnoughBalanceException([String message])
      : super(message, "Not Enough Balance Exception: ");
}