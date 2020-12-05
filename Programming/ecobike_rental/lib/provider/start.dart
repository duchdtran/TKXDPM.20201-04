import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình Start
///
class StartProvider extends StateNotifier<StartDataSet>
    with LocatorMixin {
  StartProvider() : super(StartDataSet()) ;


  Future<void> initDataSet() async {
    final newState = StartDataSet()..init = true;

    state = newState;
  }
}

class StartDataSet {
  StartDataSet() {
    init = false;
  }

  bool init;
}
