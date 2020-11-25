import 'package:state_notifier/state_notifier.dart';

import '../data/model/models.dart';
import '../repositories/payment.dart';

class PaymentProvider extends StateNotifier<PaymentDataSet> with LocatorMixin {
  PaymentProvider(this._stationId) : super(PaymentDataSet()) {
    _mRepository = PaymentRepository();
  }

  final int _stationId;

  PaymentRepository _mRepository;

  Future<void> initDataSet() async {
    final newState = PaymentDataSet()
      ..listCard = await _mRepository.getListCard()
      ..paymentChoose = state.paymentChoose
      ..init = true;

    state = newState;
  }

  Future<void> selectPaymentMethod(int index) async {
    if (index < 0 || index >= state.listCard.length) {
      return Future.error('Code ngu vl');
    }
    state.paymentChoose = index;
    await initDataSet();
  }
}

class PaymentDataSet {
  PaymentDataSet() {
    init = false;
    paymentChoose = 0;
  }

  bool init;
  List<Card> listCard;
  int paymentChoose;
}
