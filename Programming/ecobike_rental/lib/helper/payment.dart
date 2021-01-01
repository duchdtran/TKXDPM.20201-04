import 'api/payment_api.dart';
import 'api/request/transaction.dart';
import 'util/converter.dart';

/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Payment
class ApiPaymentHelper implements IPaymentHelper {
  PaymentApi api = PaymentApi();

  Future<String> processTransaction(TransactionRequest transaction) async {
    final errorCode = await api.processTransaction(transaction);

    return Future.value(Converter.convertCodeErrorToMessage(errorCode));
  }
}

abstract class IPaymentHelper {
  Future<String> processTransaction(TransactionRequest transaction);
}
