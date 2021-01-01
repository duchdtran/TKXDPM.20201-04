import 'package:state_notifier/state_notifier.dart';

import '../helper/bike.dart';
import '../model/bike.dart';
import '../model/card.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Bike Screen
/// @author duchdtran
class BikeProvider extends StateNotifier<BikeDataSet> with LocatorMixin {
  BikeProvider(bikeId, bikeHelper) : super(BikeDataSet()) {
    _bikeId = bikeId;
    _bikeHelper = bikeHelper;
  }

  int _bikeId;

  IBikeHelper _bikeHelper;

  /// Khởi tạo dữ liệu cho màn hình bike screen
  Future<void> initDataSet() async {
    final newState = BikeDataSet()
      ..bike = await _bikeHelper.getBike(
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
  List<CardInfo> listCard;
}
