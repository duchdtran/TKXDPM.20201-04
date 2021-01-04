import 'payment.dart';

class NotEnoughTransactionInfoException extends PaymentException{
  NotEnoughTransactionInfoException()
      : super("Không đủ thông tin giao dịch");
}