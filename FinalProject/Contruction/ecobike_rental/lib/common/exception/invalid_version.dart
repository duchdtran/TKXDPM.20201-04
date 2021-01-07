import 'payment.dart';

class InvalidVersionException extends PaymentException{
  InvalidVersionException()
      : super("Thiếu thông tin version");
}