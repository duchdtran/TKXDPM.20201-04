import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình home
///
class HomeProvider extends StateNotifier<HomeDataSet> with LocatorMixin {
  HomeProvider() : super(HomeDataSet()) {
    try {
      _stationHelper = StationHelper();
      _rentalHelper = RentalHelper();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  StationHelper _stationHelper;
  RentalHelper _rentalHelper;

  Future<void> initDataSet() async {
    final newState = HomeDataSet()
      ..bike = await _rentalHelper.checkRentBike()
      ..listStation = await _stationHelper.getListStation()
      ..init = true;
    state = newState;
  }

  Future<void> getRentalInfo() async {}

  Future<int> returnBike() async {
    try {
      const stationId = 1001;
      const bikeId = 100002;
      await _rentalHelper.returnBike(stationId, bikeId);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}

class HomeDataSet {
  HomeDataSet() {
    init = false;
  }

  bool init;
  Bike bike;
  List<Station> listStation;
}
