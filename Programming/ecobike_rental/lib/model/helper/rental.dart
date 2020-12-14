import '../core/cores.dart';
import '../service/network/rental_api.dart';
import '../service/network/response/rental.dart';
import 'converter.dart';

class RentalHelper {
  final api = RentalApi();
  Future<Rental> getRentalInfo() async {
    RentalResponse response;
    const deviceCode = 'b89570dd-9ae3-4317-b610-6de2b548764c';
    response = await api.getRentalInfo(deviceCode);
    return Future.value(Converter.convertRentalResponse(response));
  }
}
