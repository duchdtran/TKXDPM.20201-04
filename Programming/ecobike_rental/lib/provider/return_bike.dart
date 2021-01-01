import 'package:ecobike_rental/model/bike.dart';
import 'package:ecobike_rental/model/station.dart';
import 'package:state_notifier/state_notifier.dart';

import '../helper/payment.dart';
import '../helper/rental.dart';
import '../helper/station.dart';
import '../helper/api/request/transaction.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Return Bike Screen
/// @author duchdtran
class ReturnBikeProvider extends StateNotifier<ReturnBikeDataSet>
    with LocatorMixin {
  ReturnBikeProvider(paymentHelper, stationHelper, rentalHelper) : super(ReturnBikeDataSet()) {
    _mPaymentHelper = paymentHelper;
    _mStationHelper = stationHelper;
    _rentalHelper = rentalHelper;
  }

  IPaymentHelper _mPaymentHelper;

  IRentalHelper _rentalHelper;

  IStationHelper _mStationHelper;

  /// Khởi tạo dữ liệu cho màn hình return bike screen
  Future<void> initDataSet() async {
    final newState = ReturnBikeDataSet()
      ..listStation = await _mStationHelper.getListStation()
      ..bikeRented = await _rentalHelper.checkRentBike()
      ..init = true;

    state = newState;
  }

  ///Trả xe
  ///@stationId mã trạm xe muốn trả
  ///@bikeId mã xe đang thuê
  ///@return số tiền cần trả lại
  Future<int> returnBike(int stationId, int bikeId) async {
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
class ReturnBikeDataSet {
  ReturnBikeDataSet() {
    init = false;
  }

  bool init;
  Bike bikeRented;
  List<Station> listStation;
}
