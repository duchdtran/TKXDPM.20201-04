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

  Future<Station> getStation(int stationId) {
    final bike = Bike(
      bikeName: 'Xe đạp thể thao Formix',
      images: [
        'https://product.hstatic.net/1000119998/product/xe-dap-dia-hinh-fornix-m3-7_347de045d9294fcba1f50f7d54723c88_large.jpg',
      ],
      bikeType: BikeType.singleBike,
      description: BikeType.singleBike.toString(),
      costHourlyRent: 7000,
    );
    final bike1 = Bike(
      bikeName: 'Xe đạp thể thao Formix',
      images: [
        'https://product.hstatic.net/1000119998/product/xe-dap-dia-hinh-fornix-m3-7_347de045d9294fcba1f50f7d54723c88_large.jpg',
      ],
      bikeType: BikeType.doubleBike,
      description: BikeType.singleBike.toString(),
      costHourlyRent: 7000,
    );
    final bike2 = Bike(
      bikeName: 'Xe đạp thể thao ABC',
      images: [
        'https://product.hstatic.net/1000119998/product/xe-dap-dia-hinh-fornix-m3-7_347de045d9294fcba1f50f7d54723c88_large.jpg',
      ],
      bikeType: BikeType.electricBike,
      description: BikeType.singleBike.toString(),
      costHourlyRent: 7000,
    );

    final station = Station(
      stationName: 'Bãi xe đảo cọsss',
      bikes: [bike, bike, bike, bike, bike1, bike2, bike1],
    );
    return Future.value(station);
  }
}
