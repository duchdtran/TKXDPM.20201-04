import 'package:state_notifier/state_notifier.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Scanner Screen
/// @author duchdtran
class ScannerProvider extends StateNotifier<ScannerDataSet>
    with LocatorMixin {
  ScannerProvider() : super(ScannerDataSet()) ;

  /// Khởi tạo dữ liệu cho màn hình scanner screen
  Future<void> initDataSet() async {
    final newState = ScannerDataSet()..init = true;

    state = newState;
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
