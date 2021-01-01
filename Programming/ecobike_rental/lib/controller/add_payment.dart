import 'package:state_notifier/state_notifier.dart';

import '../model/card.dart';



/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Add Payment Screen
/// @author duchdtran
class AddPaymentProvider extends StateNotifier<AddPaymentDataSet> with LocatorMixin {
  AddPaymentProvider(paymentHelper) : super(AddPaymentDataSet()) {
  }

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
