import 'package:ecobike_rental/data/database.dart';

class Address extends Model {
  static String tableName = "address";
  static String key = "addressID";
  Address({this.addressID, this.latitude, this.longitude});

  int addressID;
  double latitude;
  double longitude;
}
