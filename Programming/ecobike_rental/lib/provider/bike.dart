import 'package:flutter/widgets.dart';
import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình Bike
///
class BikeProvider extends StateNotifier<BikeDataSet> with LocatorMixin {
  BikeProvider(this._bikeId) : super(BikeDataSet()) {
    _bikeHelper = BikeHelper();
    _paymentHelper = PaymentHelper();
  }

  final int _bikeId;

  BikeHelper _bikeHelper;
  PaymentHelper _paymentHelper;

  Future<void> initDataSet() async {
    final newState = BikeDataSet()
      ..bike = await _bikeHelper.getBike(
        _bikeId,
      )
      ..listCard = await _paymentHelper.getListCard()
      ..init = true;

    state = newState;
  }
}

class BikeDataSet extends ChangeNotifier {
  BikeDataSet() {
    init = false;
    indicatorImageBike = 0;
  }

  int indicatorImageBike;
  bool init;
  Bike bike;
  List<CardInfo> listCard;

  void setIndicatorImageBike(int value) {
    indicatorImageBike = value;
    notifyListeners();
  }
}
