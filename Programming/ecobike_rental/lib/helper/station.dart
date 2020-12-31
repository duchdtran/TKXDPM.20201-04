import '../model/station.dart';

import 'api/station_api.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Station
///
class ApiStationHelper implements IStationHelper {
  final api = StationApi();

  Future<List<Station>> getListStation() async {
    final response = <Station>[];
    final listStation = await api.getListStation();
    listStation.forEach(
      response.add,
    );
    return Future.value(response);
  }

  Future<Station> getStation(int stationId) async {
    final response = await api.getStation(stationId);
    return Future.value(response);
  }
}

abstract class IStationHelper {
  Future<List<Station>> getListStation();
  Future<Station> getStation(int stationId);
}
