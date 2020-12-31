import 'package:tuple/tuple.dart';
import 'package:ecobike_rental/model/cores.dart';

import 'package:ecobike_rental/config/device.dart';
import 'api/rental_api.dart';

class RentalHelper {
  final api = RentalApi();
  String deviceCode = DEVICE_CODE;

  Future<Rental> getRentalInfo() async {
    Rental response;
    response = await api.getRentalInfo(deviceCode);
    return Future.value(response);
  }

  Future<Bike> checkRentBike() async {
    Bike response;
    response = await api.checkRentBike(deviceCode);
    return Future.value(response);
  }

  Future<bool> rentBike(int bikeId, int deposit) async{
    bool response;
    response = await api.rentBike(deviceCode, bikeId, deposit);
    return Future.value(response);
  }

  Future<void> returnBike(int stationId, int bikeId) async {
    await api.returnBike(deviceCode, stationId, bikeId);
  }

  Future<Tuple2<int, int>> getInvoice(int bikeId) async{
    Tuple2<int, int> response;
    response = await api.getInvoice(deviceCode, bikeId);
    return Future.value(response);
  }
}
