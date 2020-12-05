import '../core/cores.dart';
import '../service/network/bike_api.dart';
import 'converter.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Bike
///
class BikeHelper implements BikeHelperInterface {
  BikeApi api = BikeApi();
  @override
  Future<Bike> getBike(int bikeId) async {
    final bike = await api.getBike(bikeId);

    return Future.value(Converter.convertBikeResponse(bike));
  }

  @override
  Future<List<Bike>> getListBike({int stationId, int bikeType}) {
    final bike = SingleBike(
      bikeName: 'Xe đạp thể thao DBN',
      images: [
        'https://product.hstatic.net/1000119998/product/xe-dap-dia-hinh-fornix-m3-7_347de045d9294fcba1f50f7d54723c88_large.jpg',
      ],
      description: 'fsdfgsd',
      costHourlyRent: 7000,
    );

    final listBike = <Bike>[bike, bike, bike, bike];
    return Future.value(listBike);
  }
}

abstract class BikeHelperInterface {
  Future<Bike> getBike(int bikeId);
  Future<List<Bike>> getListBike({int stationId, int bikeType});
}
