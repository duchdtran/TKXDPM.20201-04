import 'payment.dart';

class InternalServerErrorException extends PaymentException{
  InternalServerErrorException()
      : super("Lỗi server");
}