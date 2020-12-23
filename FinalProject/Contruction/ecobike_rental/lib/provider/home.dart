import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Start Screen
/// @author duchdtran
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

  /// Khởi tạo dữ liệu cho màn hình start screen
  Future<void> initDataSet() async {
    final newState = HomeDataSet()
      ..bike = await _rentalHelper.checkRentBike()
      ..listStation = await _stationHelper.getListStation()
      ..init = true;
    state = newState;
  }
}

/// Class chứa dữ liệu cho màn hình Start Screen
/// @author duchdtran
class HomeDataSet {
  HomeDataSet() {
    init = false;
  }

  bool init;
  Bike bike;
  List<Station> listStation;
}
