import '../core/cores.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Payment
///
class PaymentHelper implements PaymentHelperInterface{
  @override
  Future<List<Card>> getListCard() async {
    var lCard = <Card>[
      Card(cardCode: '125445', paymentMethod: 'Visa'),
      Card(cardCode: '214556', paymentMethod: 'VietTinbank'),
      Card(cardCode: '214556', paymentMethod: 'VietTinbank'),
    ];
    return Future.value(lCard);
  }

}

abstract class PaymentHelperInterface{
  Future<List<Card>> getListCard();
}
