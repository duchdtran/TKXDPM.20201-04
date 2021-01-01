import 'package:state_notifier/state_notifier.dart';

import '../helper/station.dart';
import '../model/bike.dart';
import '../model/station.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Station Screen
/// @author duchdtran
class StationProvider extends StateNotifier<StationDataSet> with LocatorMixin {
  StationProvider(stationId, stationHelper) : super(StationDataSet()) {
    _stationId = stationId;
    _mStationHelper = stationHelper;
  }

  int _stationId;

  IStationHelper _mStationHelper;

  /// Khởi tạo dữ liệu cho màn hình station screen
  Future<void> initDataSet() async {
    final newState = StationDataSet()
      ..station = await _mStationHelper.getStation(
        _stationId,
      )
      ..init = true;

    state = newState;
  }

  ///Lấy danh sách xe theo loại
  ///@bikeType loại xe
  ///@return Danh sách các xe trong trạm theo loại
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

/// Class chứa dữ liệu cho màn hình Station Screen
/// @author duchdtran
class StationDataSet {
  StationDataSet() {
    init = false;
  }

  bool init;
  Station station;
}
