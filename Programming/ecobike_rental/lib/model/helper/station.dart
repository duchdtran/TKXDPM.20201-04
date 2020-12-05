import '../core/cores.dart';
import '../service/network/station_api.dart';
import 'converter.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Station
///
class StationHelper {
  final api = StattionApi();

  Future<List<Station>> getListStation() async {
    var result = List<Station>();
    final ListStation = await api.getListStation();
    ListStation.forEach(
      (element) {
        result.add(Converter.convertStationResponse(element));
      },
    );
    return Future.value(result);
  }

  Future<Station> getStation(int stationId) async {
    final station = await api.getStation(stationId);
    return Future.value(Converter.convertStationResponse(station));
  }
}
