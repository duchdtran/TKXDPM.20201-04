import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình AddPayment
///
class AddPaymentProvider extends StateNotifier<AddPaymentDataSet>
    with LocatorMixin {
  AddPaymentProvider() : super(AddPaymentDataSet()) {
    _mStationHelper = StationHelper();
  }

  StationHelper _mStationHelper;

  Future<void> initDataSet() async {
    final newState = AddPaymentDataSet()..init = true;

    state = newState;
  }
}

class AddPaymentDataSet {
  AddPaymentDataSet() {
    init = false;
  }

  bool init;
}
