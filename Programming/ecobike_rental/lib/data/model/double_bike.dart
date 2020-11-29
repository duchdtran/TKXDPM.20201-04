import 'bike.dart';

class DoubleBike extends Bike {

  static DoubleBike fromMap(Map<String, dynamic> map) {
    DoubleBike bike = Bike.fromMap(map);
    return bike;
  }
}
