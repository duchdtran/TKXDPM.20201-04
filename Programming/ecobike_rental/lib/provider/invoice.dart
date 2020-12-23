import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';
import '../model/service/network/request/transaction.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Return Bike Screen
/// @author duchdtran
class InvoiceProvider extends StateNotifier<InvoiceDataSet>
    with LocatorMixin {
  InvoiceProvider() : super(InvoiceDataSet()) {
    _mPaymentHelper = PaymentHelper();
    _rentalHelper = RentalHelper();
  }

  PaymentHelper _mPaymentHelper;

  RentalHelper _rentalHelper;

  /// Khởi tạo dữ liệu cho màn hình return bike screen
  Future<void> initDataSet() async {
    final newState = InvoiceDataSet()
      ..bikeRented = await _rentalHelper.checkRentBike();

    final response = await _rentalHelper.getInvoice(newState.bikeRented.id);

    newState.totalTime = response.item1;
    newState.rentalMoney = response.item2;

    newState.returnMoney = newState.bikeRented.deposits - newState.rentalMoney;
    newState.init = true;

    state = newState;
  }

  ///Lấy hóa đơn
  Future<void> getInvoice() async{
    await _rentalHelper.getInvoice(state.bikeRented.id);
  }

  ///Trả xe
  ///@stationId mã trạm xe muốn trả
  ///@bikeId mã xe đang thuê
  ///@return số tiền cần trả lại
  Future<void> returnBike(int stationId, int bikeId) async {
    await _rentalHelper.returnBike(stationId, bikeId);
  }

  ///Thanh toán
  ///@transaction nội dung giao dịch
  ///@return thông điệp trả về từ server ngân hàng
  Future<String> processTransaction(TransactionRequest transaction) async {
    final message = await _mPaymentHelper.processTransaction(transaction);
    return Future.value(message);
  }


}


/// Class chứa dữ liệu cho màn hình Return Bike Screen
/// @author duchdtran
class InvoiceDataSet {
  InvoiceDataSet() {
    init = false;
  }

  bool init;
  Bike bikeRented;
  int rentalMoney;
  int totalTime;
  int returnMoney;
}
