import 'package:ecobike_rental/model/service/network/response/rental.dart';

import '../core/cores.dart';

import '../service/network/rental_api.dart';
import 'converter.dart';

class RentalHelper {
  final api = RentalApi();
  Future<Rental> getRentalInfo() async {
    RentalResponse response;
    const deviceCode = '123';
    response = await api.getRentalInfo(deviceCode);
    return Future.value(Converter.convertRentalResponse(response));
  }
}
