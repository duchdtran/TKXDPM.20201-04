import 'package:flutter/widgets.dart';
import 'package:state_notifier/state_notifier.dart';

import '../data/model/bike.dart';
import '../data/model/models.dart';
import '../repositories/bike.dart';

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
      ..listCard = await _mRepository.getListCard()
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
  List<Card> listCard;

  void setIndicatorImageBike(int value) {
    indicatorImageBike = value;
    notifyListeners();
  }
}
