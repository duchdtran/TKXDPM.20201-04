import '../core/cores.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Station
///
class StationHelper {
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
