import 'package:ecobike_rental/repositories/station.dart';
import 'package:state_notifier/state_notifier.dart';

import '../data/model/bike.dart';
import '../data/model/station.dart';

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
