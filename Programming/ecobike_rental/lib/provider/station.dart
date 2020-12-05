import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình Station
///
class StationProvider extends StateNotifier<StationDataSet> with LocatorMixin {
  StationProvider(this._stationId) : super(StationDataSet()) {
    _mStationHelper = StationHelper();
  }

  final int _stationId;

  StationHelper _mStationHelper;

  Future<void> initDataSet() async {
    final newState = StationDataSet()
      ..station = await _mStationHelper.getStation(
        _stationId,
      )
      ..init = true;

    state = newState;
  }

  List<Bike> loadListBike(int bikeType) {
    final listBike = <Bike>[];
    for (var i = 0; i < state.station.bikes.length; i++) {
      if (state.station.bikes[i].bikeType == bikeType) {
        listBike.add(state.station.bikes[i]);
      }
    }
    return listBike;
  }
}

class StationDataSet {
  StationDataSet() {
    init = false;
  }

  bool init;
  Station station;
}
