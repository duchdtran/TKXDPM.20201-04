import 'payment.dart';

class InvalidCardException extends PaymentException{
  InvalidCardException()
      : super("Thẻ không hợp lệ");
}