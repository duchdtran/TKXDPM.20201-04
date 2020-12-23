import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Add Payment Screen
/// @author duchdtran
class AddPaymentProvider extends StateNotifier<AddPaymentDataSet>
    with LocatorMixin {
  AddPaymentProvider() : super(AddPaymentDataSet()) {
    _mPaymentHelper = PaymentHelper();
  }

  PaymentHelper _mPaymentHelper;

  /// Khởi tạo dữ liệu cho màn hình add payment screen
  Future<void> initDataSet() async {
    final newState = AddPaymentDataSet()..init = true;

    state = newState;
  }

  /// Thêm phương thức thanh toán
  Future<void> addPaymentMethod(CardInfo cardInfo){
    
  }
}

/// Class chứa dữ liệu cho màn hình Add Payment Screen
/// @author duchdtran
class AddPaymentDataSet {
  AddPaymentDataSet() {
    init = false;
  }


  CardInfo cardInfo;
  bool init;
}
