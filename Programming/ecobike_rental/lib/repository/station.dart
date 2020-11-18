import '../data/model/bike.dart';
import '../data/model/station.dart';

class StationRepository {
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
      bikeType: BikeType.singleBike,
      description: BikeType.singleBike.toString(),
      costHourlyRent: 7000,
    );
    final bike2 = Bike(
      bikeName: 'Xe đạp thể thao ABC',
      images: [
        'https://product.hstatic.net/1000119998/product/xe-dap-dia-hinh-fornix-m3-7_347de045d9294fcba1f50f7d54723c88_large.jpg',
      ],
      bikeType: BikeType.singleBike,
      description: BikeType.singleBike.toString(),
      costHourlyRent: 7000,
    );

    final station = Station(
        stationName: 'Bãi xe đảo cọsss', singleBikes: [bike, bike, bike, bike], doubleBikes: [bike1,bike1, bike1], electricBikes: [bike2, bike2, bike2, bike2, ]);
    return Future.value(station);
  }

  Future<List<Bike>> getListBike({int stationId, BikeType bikeType}){
    final bike = Bike(
      bikeName: 'Xe đạp thể thao DBN',
      images: [
        'https://product.hstatic.net/1000119998/product/xe-dap-dia-hinh-fornix-m3-7_347de045d9294fcba1f50f7d54723c88_large.jpg',
      ],
      bikeType: BikeType.singleBike,
      description: '${bikeType}',
      costHourlyRent: 7000,
    );

    final listBike = <Bike>[bike, bike, bike, bike];
    return Future.value(listBike);
  }
}
