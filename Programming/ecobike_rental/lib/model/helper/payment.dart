import '../core/cores.dart';
import '../service/network/payment_api.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Payment
///
class PaymentHelper implements PaymentHelperInterface {
  PaymentApi api = PaymentApi();

  @override
  Future<List<CardInfo>> getListCard() async {
    var lCard = <CardInfo>[
      CardInfo(cardCode: '125445', paymentMethod: 'Visa'),
      CardInfo(cardCode: '214556', paymentMethod: 'VietTinbank'),
      CardInfo(cardCode: '214556', paymentMethod: 'VietTinbank'),
    ];
    return Future.value(lCard);
  }

  Future<void> processTransaction() async {
    await api.processTransaction();
  }
}

abstract class PaymentHelperInterface {
  Future<List<CardInfo>> getListCard();
}
