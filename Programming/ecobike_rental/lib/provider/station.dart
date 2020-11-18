import 'package:state_notifier/state_notifier.dart';

import '../data/model/bike.dart';
import '../data/model/station.dart';
import '../repository/station.dart';

class StationProvider extends StateNotifier<StationDataSet> with LocatorMixin {
  StationProvider(this._stationId) : super(StationDataSet()) {
    _mRepository = StationRepository();
  }

  final int _stationId;

  StationRepository _mRepository;

  Future<void> initDataSet() async {
    final newState = StationDataSet()
      ..station = await _mRepository.getStation(
        _stationId,
      )
      ..init = true;

    state = newState;
  }

  List<Bike> loadListBike(BikeType bikeType) {
    List<Bike> listBike;
    switch (bikeType) {
      case BikeType.singleBike:
        listBike = state.station.singleBikes;
        break;
      case BikeType.doubleBike:
        listBike = state.station.doubleBikes;
        break;
      case BikeType.electricBike:
        listBike = state.station.electricBikes;
        break;
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
