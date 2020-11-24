
import '../data/model/bike.dart';

class BikeRepository {
  Future<Bike> getBike(int bikeId) async{
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

}
