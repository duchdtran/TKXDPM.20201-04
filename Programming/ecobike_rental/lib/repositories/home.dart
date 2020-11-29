import '../data/model/station.dart';

class HomeRepository {
  Future<List<Station>> getListStation() async {
    final listStation = <Station>[
      Station(
        address: null,
        area: 48.5,
        stationName: 'Bãi xe đảo cọ',
        id: 1,
        contactName: 'Duc',
      ),
      Station(
        address: null,
        area: 48.5,
        stationName: 'Bãi xe đảo cọ',
        id: 1,
        contactName: 'Duc',
      ),
      Station(
        address: null,
        area: 48.5,
        stationName: 'Bãi xe đảo cọ',
        id: 1,
        contactName: 'Duc',
      ),
    ];
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(listStation);
  }
}
