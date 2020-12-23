import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';
import '../model/service/network/request/transaction.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Return Bike Screen
/// @author duchdtran
class ReturnBikeProvider extends StateNotifier<ReturnBikeDataSet>
    with LocatorMixin {
  ReturnBikeProvider() : super(ReturnBikeDataSet()) {
    _mPaymentHelper = PaymentHelper();
    _mStationHelper = StationHelper();
    _rentalHelper = RentalHelper();
  }

  PaymentHelper _mPaymentHelper;

  RentalHelper _rentalHelper;

  StationHelper _mStationHelper;

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
