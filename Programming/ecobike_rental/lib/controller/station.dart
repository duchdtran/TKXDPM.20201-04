import 'package:state_notifier/state_notifier.dart';

import '../entity/bike/bike.dart';
import '../entity/station/station.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Station Screen
/// @author duchdtran
class StationController extends StateNotifier<StationDataSet> with LocatorMixin {
  StationController(stationId) : super(StationDataSet()) {
    _stationId = stationId;
  }

  int _stationId;

  /// Khởi tạo dữ liệu cho màn hình station screen
  Future<void> initDataSet() async {
    final newState = StationDataSet()
      ..station = await Station().getStation(
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
