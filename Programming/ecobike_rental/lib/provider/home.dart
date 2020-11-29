import 'package:ecobike_rental/repositories/home.dart';
import 'package:state_notifier/state_notifier.dart';

import '../data/model/station.dart';

class HomeProvider extends StateNotifier<HomeDataSet> with LocatorMixin {
  HomeProvider() : super(HomeDataSet()) {
    _mRepository = HomeRepository();
  }

  HomeRepository _mRepository;

  Future<void> initDataSet() async {
    final newState = HomeDataSet()
    ..listStation = await _mRepository.getListStation()
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
