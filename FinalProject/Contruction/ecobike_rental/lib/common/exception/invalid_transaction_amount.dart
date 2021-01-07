import 'payment.dart';

class InvalidTransactionAmountException extends PaymentException{
  InvalidTransactionAmountException()
      : super('Amount không hợp lệ');
}