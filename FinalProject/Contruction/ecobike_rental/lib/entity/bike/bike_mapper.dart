import 'double_bike.dart';
import 'electric_bike.dart';
import 'single_bike.dart';

  /// Lớp giúp chuyển đổi từ [bike_type] sang loại [Bike] tương ứng
  class BikeMapper {
    static Map<int, dynamic> map = {
      SingleBike.BIKE_TYPE: (json) => SingleBike.fromJson(json),
      DoubleBike.BIKE_TYPE: (json) => DoubleBike.fromJson(json),
      ElectricBike.BIKE_TYPE: (json) => ElectricBike.fromJson(json),
    };
  }

