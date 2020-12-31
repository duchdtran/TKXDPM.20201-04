import 'package:state_notifier/state_notifier.dart';

import '../model/cores.dart';
import '../service//helpers.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Bike Screen
/// @author duchdtran
class BikeProvider extends StateNotifier<BikeDataSet> with LocatorMixin {
  BikeProvider(this._bikeId) : super(BikeDataSet()) {
    _bikeHelper = BikeHelper();
  }

  final int _bikeId;

  BikeHelper _bikeHelper;

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
