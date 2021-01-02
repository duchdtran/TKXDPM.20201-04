import 'package:state_notifier/state_notifier.dart';

import '../common/exception/unrecognized.dart';
import '../entity/bike/bike.dart';
import '../entity/invoice/invoice.dart';
import '../entity/rental/rental.dart';
import '../entity/station/station.dart';
import '../ultils/config.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Start Screen
/// @author duchdtran
class HomeController extends StateNotifier<HomeDataSet> with LocatorMixin {
  HomeController() : super(HomeDataSet()) ;


  /// Khởi tạo dữ liệu cho màn hình start screen
  Future<void> initDataSet() async {
    final newState = HomeDataSet();

    try {
      newState.listStation = await Station().getListStation();
      newState.bike = await Rental().checkRentBike(Configs.DEVICE_CODE);
      newState.init = false;

      if (newState.bike != null) {
        newState.invoice =
            await Invoice().getInvoice(Configs.DEVICE_CODE, newState.bike.id);
      }
    } on UnrecognizedException catch (e) {} finally {
      newState.init = true;
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
