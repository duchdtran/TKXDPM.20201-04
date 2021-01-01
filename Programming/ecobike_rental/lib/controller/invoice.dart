import 'package:state_notifier/state_notifier.dart';

import '../common/exception/payment.dart';
import '../common/exception/unrecognized.dart';
import '../helper/rental.dart';
import '../model/bike.dart';
import '../model/credit_card.dart';
import '../subsystem/interbank_interface.dart';
import '../subsystem/interbank_subsystem.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Return Bike Screen
/// @author duchdtran
class InvoiceController extends StateNotifier<InvoiceDataSet>
    with LocatorMixin {
  InvoiceController(rentalHelper) : super(InvoiceDataSet()) {
    _rentalHelper = rentalHelper;
  }


  IRentalHelper _rentalHelper;
  InterbankInterface _interbank;

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
  Future<void> getInvoice() async {
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
  Future<Map<String, dynamic>> refund(int amount, String contents) async {
    final result = <String, dynamic>{};
    result['result'] = false;
    try{
      //Lấy từ server
      final card = CreditCard('118609_group4_2020', 'Group 4', 228, 1125);

      _interbank = InterbankSubsytem();
      await _interbank.refund(card, amount, contents);

      result['result'] = true;
      result['message'] = 'Thanh toán thành công';
    } on PaymentException catch(e) {
      result['message'] = e.toString();
    } on UnrecognizedException catch(e){
      result['message'] = e.toString();
    }
    return Future.value(result);
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
