import 'package:state_notifier/state_notifier.dart';

import '../entity/payment/credit_card.dart';


/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Add Payment Screen
/// @author duchdtran
class AddPaymentController extends StateNotifier<AddPaymentDataSet> with LocatorMixin {
  AddPaymentController() : super(AddPaymentDataSet());

  /// Khởi tạo dữ liệu cho màn hình add payment screen
  Future<void> initDataSet() async {
    final newState = AddPaymentDataSet()..init = true;

    state = newState;
  }

  /// Thêm phương thức thanh toán
  Future addPaymentMethod(CreditCard cardInfo){
    Future.value();
  }
}

/// Class chứa dữ liệu cho màn hình Add Payment Screen
/// @author duchdtran
class AddPaymentDataSet {
  AddPaymentDataSet() {
    init = false;
  }


  CreditCard cardInfo;
  bool init;
}
