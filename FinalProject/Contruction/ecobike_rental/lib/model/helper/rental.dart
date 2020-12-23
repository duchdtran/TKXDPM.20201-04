import 'package:tuple/tuple.dart';

import '../core/cores.dart';
import '../service/network/rental_api.dart';
import '../service/network/response/bike.dart';
import '../service/network/response/rental.dart';
import 'converter.dart';

class RentalHelper {
  final api = RentalApi();
  String deviceCode = 'b89570dd-9ae3-4317-b610-6de2b548764c';

  Future<Rental> getRentalInfo() async {
    RentalResponse response;
    response = await api.getRentalInfo(deviceCode);
    return Future.value(Converter.convertRentalResponse(response));
  }

  Future<Bike> checkRentBike() async {
    BikeResponse response;
    response = await api.checkRentBike(deviceCode);
    return Future.value(Converter.convertBikeResponse(response));
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
