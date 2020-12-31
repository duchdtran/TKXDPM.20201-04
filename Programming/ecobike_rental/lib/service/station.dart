import 'package:ecobike_rental/model/cores.dart';
import 'api/station_api.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Station
///
class StationHelper {
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
