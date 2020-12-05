import 'package:ecobike_rental/model/helper/helpers.dart';
import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình Payment
///
class PaymentProvider extends StateNotifier<PaymentDataSet> with LocatorMixin {
  PaymentProvider(this._bikeId) : super(PaymentDataSet()) {
    _mPaymentHelper = PaymentHelper();
  }

  final int _bikeId;

  PaymentHelper _mPaymentHelper;

  Future<void> initDataSet() async {
    final newState = PaymentDataSet()
      ..listCard = await _mPaymentHelper.getListCard()
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
