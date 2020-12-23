import 'package:ecobike_rental/model/helper/converter.dart';

import '../service/network/payment_api.dart';
import '../service/network/request/transaction.dart';

/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Payment
class PaymentHelper {
  PaymentApi api = PaymentApi();

  Future<String> processTransaction(TransactionRequest transaction) async {
    final errorCode = await api.processTransaction(transaction);

    return Future.value(Converter.convertCodeErrorToMessage(errorCode));
  }
}
