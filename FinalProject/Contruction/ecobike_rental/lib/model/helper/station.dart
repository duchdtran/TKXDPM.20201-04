import '../core/cores.dart';
import '../service/network/station_api.dart';
import 'converter.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Station
///
class StationHelper {
  final api = StattionApi();

  Future<List<Station>> getListStation() async {
    final response = <Station>[];
    final listStation = await api.getListStation();
    listStation.forEach(
      (element) {
        response.add(Converter.convertStationResponse(element));
      },
    );
    return Future.value(response);
  }

  Future<Station> getStation(int stationId) async {
    final response = await api.getStation(stationId);
    return Future.value(Converter.convertStationResponse(response));
  }
}
