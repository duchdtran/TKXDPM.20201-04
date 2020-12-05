import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình Scanner
///
class ScannerProvider extends StateNotifier<ScannerDataSet>
    with LocatorMixin {
  ScannerProvider() : super(ScannerDataSet()) ;

  Future<void> initDataSet() async {
    final newState = ScannerDataSet()..init = true;

    state = newState;
  }
}

class ScannerDataSet {
  ScannerDataSet() {
    init = false;
  }

  bool init;
}
