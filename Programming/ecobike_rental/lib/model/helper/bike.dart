import '../core/cores.dart';

///
/// Nơi lưu trữ dữ liệu về các thông tin liên quan đến Bike
///
class BikeHelper implements BikeHelperInterface{
   @override
  Future<Bike> getBike(int bikeId) async {
    final bike = Bike(
      bikeName: 'Xe đạp thể thao Formix',
      images: [
        'https://product.hstatic.net/1000119998/product/xe-dap-dia-hinh-fornix-m3-7_347de045d9294fcba1f50f7d54723c88_large.jpg',
        'https://product.hstatic.net/1000119998/product/xe-dap-dia-hinh-fornix-m3-7_347de045d9294fcba1f50f7d54723c88_large.jpg',
        'https://product.hstatic.net/1000119998/product/xe-dap-dia-hinh-fornix-m3-7_347de045d9294fcba1f50f7d54723c88_large.jpg',
      ],
      costStartingRent: 10000,
      deposits: 200000,
      bikeType: BikeType.singleBike,
      description: BikeType.singleBike.toString(),
      costHourlyRent: 7000,
    );

    return Future.value(bike);
  }

   @override
  Future<List<Bike>> getListBike({int stationId, BikeType bikeType}) {
     final bike = Bike(
       bikeName: 'Xe đạp thể thao DBN',
       images: [
         'https://product.hstatic.net/1000119998/product/xe-dap-dia-hinh-fornix-m3-7_347de045d9294fcba1f50f7d54723c88_large.jpg',
       ],
       bikeType: BikeType.singleBike,
       description: '$bikeType',
       costHourlyRent: 7000,
     );

     final listBike = <Bike>[bike, bike, bike, bike];
     return Future.value(listBike);
   }
}

abstract class BikeHelperInterface{
   Future<Bike> getBike(int bikeId);
   Future<List<Bike>> getListBike({int stationId, BikeType bikeType});
}
