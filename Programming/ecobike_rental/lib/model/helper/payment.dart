import '../core/cores.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Payment
///
class PaymentHelper implements PaymentHelperInterface {
  @override
  Future<List<CardInfo>> getListCard() async {
    var lCard = <CardInfo>[
      CardInfo(cardCode: '125445', paymentMethod: 'Visa'),
      CardInfo(cardCode: '214556', paymentMethod: 'VietTinbank'),
      CardInfo(cardCode: '214556', paymentMethod: 'VietTinbank'),
    ];
    return Future.value(lCard);
  }
}

abstract class PaymentHelperInterface {
  Future<List<CardInfo>> getListCard();
}
