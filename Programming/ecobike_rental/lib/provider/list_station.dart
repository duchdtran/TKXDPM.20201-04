import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình List Station
///
class ListStationProvider extends StateNotifier<ListStationDataSet>
    with LocatorMixin {
  ListStationProvider() : super(ListStationDataSet()) {
    _mStationHelper = StationHelper();
  }

  StationHelper _mStationHelper;

  Future<void> initDataSet() async {
    final newState = ListStationDataSet()..init = true;

    state = newState;
  }
}

class ListStationDataSet {
  ListStationDataSet() {
    init = false;
  }

  bool init;
}
