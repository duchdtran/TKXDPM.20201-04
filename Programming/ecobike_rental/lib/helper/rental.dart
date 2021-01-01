import '../config/device.dart';
import '../model/bike.dart';
import '../model/invoice.dart';
import '../model/rental.dart';
import 'api/rental_api.dart';

class ApiRentalHelper implements IRentalHelper {
  final api = RentalApi();
  String deviceCode = DEVICE_CODE;

  @override
  Future<Rental> getRentalInfo() async {
    Rental response;
    response = await api.getRentalInfo(deviceCode);
    return Future.value(response);
  }

  @override
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

  @override
  Future<Invoice> getInvoice(int bikeId) async{
    var invoice = await api.getInvoice(deviceCode, bikeId);
    return Future.value(invoice);
  }
}

abstract class IRentalHelper {
  Future<Rental> getRentalInfo();
  Future<Bike> checkRentBike();
  Future<bool> rentBike(int bikeId, int deposit);
  Future<void> returnBike(int stationId, int bikeId);
  Future<Invoice> getInvoice(int bikeId);
}
