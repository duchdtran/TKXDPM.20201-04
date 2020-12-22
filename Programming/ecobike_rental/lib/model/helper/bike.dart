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
    final response = await api.getBike(bikeId);

    return Future.value(Converter.convertBikeResponse(response));
  }
}

abstract class BikeHelperInterface {
  Future<Bike> getBike(int bikeId);
}
