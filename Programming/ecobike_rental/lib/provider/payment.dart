import 'package:ecobike_rental/repositories/payment.dart';
import 'package:flutter/widgets.dart';
import 'package:state_notifier/state_notifier.dart';

import '../data/model/models.dart';

class PaymentProvider extends StateNotifier<PaymentDataSet> with LocatorMixin {
  PaymentProvider(this._stationId) : super(PaymentDataSet()) {
    _mRepository = PaymentRepository();
  }

  final int _stationId;

  PaymentRepository _mRepository;

  Future<void> initDataSet() async {
    final newState = PaymentDataSet()
      ..listCard = await _mRepository.getListCard()
      ..init = true;

    state = newState;
  }

}

class PaymentDataSet{
  PaymentDataSet() {
    init = false;
  }

  bool init;
  List<Card> listCard;

}
