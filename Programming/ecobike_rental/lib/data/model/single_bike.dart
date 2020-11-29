import 'package:ecobike_rental/data/model/bike.dart';

class SingleBike extends Bike {

  static SingleBike fromMap(Map<String, dynamic> map) {
    SingleBike bike = Bike.fromMap(map);
    return bike;
  }
}
