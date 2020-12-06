import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình home
///
class HomeProvider extends StateNotifier<HomeDataSet> with LocatorMixin {
  HomeProvider() : super(HomeDataSet()) {
    _stationHelper = StationHelper();
    _rentalHelper = RentalHelper();
  }

  StationHelper _stationHelper;
  RentalHelper _rentalHelper;

  Future<void> initDataSet() async {
    final newState = HomeDataSet()
      ..rental = await _rentalHelper.getRentalInfo()
      ..listStation = await _stationHelper.getListStation()
      ..init = true;
    state = newState;
  }

  Future<void> getRentalInfo() async {}
}

class HomeDataSet {
  HomeDataSet() {
    init = false;
  }

  bool init;
  Rental rental;
  List<Station> listStation;
}
