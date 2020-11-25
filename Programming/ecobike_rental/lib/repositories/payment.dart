import '../data/model/models.dart';

class PaymentRepository {
  Future<List<Card>> getListCard() async {
    var lCard = <Card>[
      Card(cardCode: '125445', paymentMethod: 'Visa'),
      Card(cardCode: '214556', paymentMethod: 'VietTinbank'),
    ];
    return Future.value(lCard);
  }
}
