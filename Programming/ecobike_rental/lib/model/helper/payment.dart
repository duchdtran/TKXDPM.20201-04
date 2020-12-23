import '../service/network/payment_api.dart';
import '../service/network/request/transaction.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Payment
///
class PaymentHelper {
  PaymentApi api = PaymentApi();

  Future<String> processTransaction(TransactionRequest transaction) async {
    final errorCode = await api.processTransaction(transaction);
    String message;
    switch (errorCode) {
      case '00':
        message = 'Giao dịch thành công';
        break;
      case '01':
        message = 'Thẻ không hợp lệ';
        break;
      case '02':
        message = 'Thẻ không đủ số dư';
        break;
      case '03':
        message = 'Internal Server Error';
        break;
      case '04':
        message = 'Giao dịch bị nghi ngờ gian lận';
        break;
      case '05':
        message = 'Không đủ thông tin giao dịch';
        break;
      case '06':
        message = 'Amount không hợp lệ';
        break;

      case '07':
        message = 'Giao dịch thành công';
        break;
      default:
        message = "";
    }
    return Future.value(message);
  }
}
