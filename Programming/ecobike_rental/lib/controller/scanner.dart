import 'package:ecobike_rental/entity/bike/bike.dart';
import 'package:state_notifier/state_notifier.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Scanner Screen
/// @author duchdtran
class ScannerController extends StateNotifier<ScannerDataSet>
    with LocatorMixin {
  ScannerController() : super(ScannerDataSet()) ;

  /// Khởi tạo dữ liệu cho màn hình scanner screen
  Future<void> initDataSet() async {
    final newState = ScannerDataSet()..init = true;

    state = newState;
  }

  Future<bool> checkBikeAxist(int bikeId) async{
    try {
      await Bike().getBike(bikeId);
      return Future.value(true);
    } on Exception{
      return Future.value(false);
    }
  }
}

/// Class chứa dữ liệu cho màn hình Scanner Screen
/// @author duchdtran
class ScannerDataSet {
  ScannerDataSet() {
    init = false;
  }

  bool init;
}
