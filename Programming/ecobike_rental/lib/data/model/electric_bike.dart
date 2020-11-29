import 'bike.dart';

class ElectricBike extends Bike {
  ElectricBike(this.batteryCapacity, this.powerDrain);

  ElectricBike.empty();

  int batteryCapacity;
  double powerDrain;

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    var map = super.toMap();
    map["battery_capacity"] = batteryCapacity;
    map["power_drain"] = powerDrain;
    return map;
  }

  static ElectricBike fromMap(Map<String, dynamic> map) {
    ElectricBike bike = Bike.fromMap(map);
    bike.powerDrain = map["power_drain"];
    bike.batteryCapacity = map["battery_capacity"];
    return bike;
  }
}
