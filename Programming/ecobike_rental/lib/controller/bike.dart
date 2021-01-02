import 'package:state_notifier/state_notifier.dart';

import '../entity/bike/bike.dart';
import '../entity/payment/credit_card.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Bike Screen
/// @author duchdtran
class BikeController extends StateNotifier<BikeDataSet> with LocatorMixin {
  BikeController(bikeId) : super(BikeDataSet()) {
    _bikeId = bikeId;
  }

  int _bikeId;


  /// Khởi tạo dữ liệu cho màn hình bike screen
  Future<void> initDataSet() async {
    final newState = BikeDataSet()
      ..bike = await Bike().getBike(
        _bikeId,
      )
      ..init = true;

    state = newState;
  }
}

/// Class chứa dữ liệu cho màn hình Bike Screen
/// @author duchdtran
class BikeDataSet {
  BikeDataSet() {
    init = false;
  }

  bool init;
  Bike bike;
  List<CreditCard> listCard;
}
