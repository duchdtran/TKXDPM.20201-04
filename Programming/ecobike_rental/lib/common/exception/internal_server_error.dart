import 'payment.dart';

class InternalServerErrorException extends PaymentException{
  InternalServerErrorException([String message])
      : super(message, "Internal Server Error Exception: ");
}