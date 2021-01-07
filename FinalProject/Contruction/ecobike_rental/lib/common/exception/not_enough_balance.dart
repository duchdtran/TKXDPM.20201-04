import 'payment.dart';

class NotEnoughBalanceException extends PaymentException{
  NotEnoughBalanceException()
      : super("Thẻ không đủ số dư");
}