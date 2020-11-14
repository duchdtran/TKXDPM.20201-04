import 'package:ecobike_rental/data/model/address.dart';

class Station{

  Station({this.stationId, this.stationName, this.address, this.emailAddress,
      this.phoneNumber, this.area});

  int stationId;
  String stationName;
  Address address;
  String emailAddress;
  String phoneNumber;
  double area;
}
