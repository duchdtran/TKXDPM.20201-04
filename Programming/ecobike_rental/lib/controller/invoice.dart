import 'package:state_notifier/state_notifier.dart';

import '../helper/api/request/transaction.dart';
import '../helper/payment.dart';
import '../helper/rental.dart';
import '../model/bike.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Return Bike Screen
/// @author duchdtran
class InvoiceProvider extends StateNotifier<InvoiceDataSet>
    with LocatorMixin {
  InvoiceProvider(paymentHelper, rentalHelper) : super(InvoiceDataSet()) {
    _mPaymentHelper = paymentHelper;
    _rentalHelper = rentalHelper;
  }

  IPaymentHelper _mPaymentHelper;

  IRentalHelper _rentalHelper;

  /// Khởi tạo dữ liệu cho màn hình return bike screen
  Future<void> initDataSet() async {
    final newState = InvoiceDataSet()
      ..bikeRented = await _rentalHelper.checkRentBike();

    final invoice = await _rentalHelper.getInvoice(newState.bikeRented.id);

    newState.totalTime = invoice.minutes;
    newState.rentalMoney = invoice.fee;

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
