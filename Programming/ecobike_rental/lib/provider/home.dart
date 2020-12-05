import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình home
///
class HomeProvider extends StateNotifier<HomeDataSet> with LocatorMixin {
  HomeProvider() : super(HomeDataSet()) {
    _mStationHelper = StationHelper();
  }

  StationHelper _mStationHelper;

  Future<void> initDataSet() async {
    final newState = HomeDataSet()
    ..listStation = await _mStationHelper.getListStation()
    ..init = true;

    state = newState;

  }
}

class HomeDataSet {
  HomeDataSet() {
    init = false;
  }

  bool init;
  List<Station> listStation;
}
