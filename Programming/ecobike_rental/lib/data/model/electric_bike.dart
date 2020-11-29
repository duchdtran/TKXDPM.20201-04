import 'bike.dart';

class ElectricBike extends Bike {
  ElectricBike(this.batteryCapacity, this.powerDrain);

  ElectricBike.empty();

  ElectricBike.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    powerDrain = map["power_drain"];
    batteryCapacity = map["battery_capacity"];
  }

  int batteryCapacity;
  double powerDrain;

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map["battery_capacity"] = batteryCapacity;
    map["power_drain"] = powerDrain;
    return map;
  }
}
