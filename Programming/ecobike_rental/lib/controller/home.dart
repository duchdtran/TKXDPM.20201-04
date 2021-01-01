import 'package:ecobike_rental/model/station.dart';
import 'package:state_notifier/state_notifier.dart';

import '../helper/rental.dart';
import '../helper/station.dart';
import '../model/bike.dart';
import '../model/invoice.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Start Screen
/// @author duchdtran
class HomeController extends StateNotifier<HomeDataSet> with LocatorMixin {
  HomeController(stationHelper, rentalHelper) : super(HomeDataSet()) {
    _stationHelper = stationHelper;
    _rentalHelper = rentalHelper;
  }

  IStationHelper _stationHelper;
  IRentalHelper _rentalHelper;

  /// Khởi tạo dữ liệu cho màn hình start screen
  Future<void> initDataSet() async {
    final newState = HomeDataSet()
      ..bike = await _rentalHelper.checkRentBike()
      ..listStation = await _stationHelper.getListStation()
      ..invoice = null
      ..init = true;

    if (newState.bike != null) {
      newState.invoice = await _rentalHelper.getInvoice(newState.bike.id);
    }
    state = newState;
  }
}

/// Class chứa dữ liệu cho màn hình Start Screen
/// @author duchdtran
class HomeDataSet {
  HomeDataSet() {
    init = false;
  }

  bool init;
  Bike bike;
  Invoice invoice;
  List<Station> listStation;
}
