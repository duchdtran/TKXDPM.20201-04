import '../address/address.dart';

class Renter {
  Renter._privateConstructor();

  static final Renter _instance = Renter._privateConstructor();

  factory Renter() {
    return _instance;
  }

  int id;
  String renterName;
  final _deviceCode = '5c9a7697-1ab7-4025-a8b1-73eeed009893';
  Address address = Address(latitude: 0, longitude: 0);

  String getDeviceCode(){
    return _deviceCode;
  }
}
