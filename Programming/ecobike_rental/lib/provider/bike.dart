import 'package:ecobike_rental/repositories/bike.dart';
import 'package:flutter/widgets.dart';
import 'package:state_notifier/state_notifier.dart';

import '../data/model/bike.dart';

class BikeProvider extends StateNotifier<BikeDataSet> with LocatorMixin {
  BikeProvider(this._stationId) : super(BikeDataSet()) {
    _mRepository = BikeRepository();
  }

  final int _stationId;

  BikeRepository _mRepository;

  Future<void> initDataSet() async {
    final newState = BikeDataSet()
      ..bike = await _mRepository.getBike(
        _stationId,
      )
      ..init = true;

    state = newState;
  }


}

class BikeDataSet extends ChangeNotifier{
  BikeDataSet() {
    init = false;
    indicatorImageBike = 0;
  }

  int indicatorImageBike;
  bool init;
  Bike bike;

  void setIndicatorImageBike(int value) {
    indicatorImageBike = value;
    notifyListeners();
  }
}
