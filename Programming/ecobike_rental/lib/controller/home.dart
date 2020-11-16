import "package:state_notifier/state_notifier.dart";

import '../data/model/address.dart';
import '../data/model/station.dart';

class HomeController extends StateNotifier<HomeDataSet> with LocatorMixin {
  HomeController() : super(HomeDataSet());

  Future<void> initDataSet() async {
    await _updateListStationAround();
  }

  Future<void> _updateListStationAround() async {
    final listStation = <Station>[Station(
          stationId: 1,
          stationName: 'Bãi gửi xe đảo cọ',
          area: 45.6,
          emailAddress: 'test123@gmail.com',
          phoneNumber: '0868330147',
          address: Address(addressID: 1, latitude: 21.4, longitude: 114.2),
        ), Station(
          stationId: 2,
          stationName: 'Bãi gửi xe phía tây',
          area: 58.6,
          emailAddress: 'test123@gmail.com',
          phoneNumber: '0868330147',
          address: Address(addressID: 1, latitude: 21.4, longitude: 114.2),
        ), Station(
          stationId: 3,
          stationName: 'Bãi gửi xe mùa đông',
          area: 85.6,
          emailAddress: 'test123@gmail.com',
          phoneNumber: '0868330147',
          address: Address(addressID: 1, latitude: 21.4, longitude: 114.2),
        )]
      ;

    state.listStation = listStation;
  }
}

class HomeDataSet {
  HomeDataSet();

  List<Station> listStation;
}
