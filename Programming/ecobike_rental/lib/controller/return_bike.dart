import 'package:state_notifier/state_notifier.dart';

import '../entity/bike/bike.dart';
import '../entity/rental/rental.dart';
import '../entity/station/station.dart';
import '../utils/config.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Return Bike Screen
/// @author duchdtran
class ReturnBikeController extends StateNotifier<ReturnBikeDataSet>
    with LocatorMixin {
  ReturnBikeController() : super(ReturnBikeDataSet());



  /// Khởi tạo dữ liệu cho màn hình return bike screen
  Future<void> initDataSet() async {
    final newState = ReturnBikeDataSet()
      ..listStation = await Station().getListStation()
      ..bikeRented = await Rental().checkRentBike(Configs.DEVICE_CODE)
      ..init = true;

    state = newState;
  }
}


/// Class chứa dữ liệu cho màn hình Return Bike Screen
/// @author duchdtran
class ReturnBikeDataSet {
  ReturnBikeDataSet() {
    init = false;
  }

  bool init;
  Bike bikeRented;
  List<Station> listStation;
}
