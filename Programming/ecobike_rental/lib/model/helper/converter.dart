import '../core/cores.dart';
import '../service/network/response/station.dart';

class Converter {
  static Station convertStationResponse(StationResponse response) {
    return Station(
      address: convertAddressResponse(response.address),
      area: response.area,
      contactName: response.contactName,
      //bikes: response.listBike);
      email: response.email,
      phone: response.phone,
    );
  }

  static Address convertAddressResponse(AddressResponse response) {
    return Address(
      addressName: response.addressName,
      latitude: response.latitude,
      longitude: response.longitude,
    );
  }
}
