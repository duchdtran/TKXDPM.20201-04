import 'package:ecobike_rental/model/service/network/request/transaction.dart';
import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình Station
///
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

  Future<void> initDataSet() async {
    final newState = ReturnBikeDataSet()
      ..listStation = await _mStationHelper.getListStation()
      ..bikeRented = await _rentalHelper.checkRentBike()
      ..init = true;

    state = newState;
  }

  Future<int> returnBike(int stationId, int bikeId) async {
    await _rentalHelper.returnBike(stationId, bikeId);
  }

  Future<String> processTransaction(TransactionRequest transaction) async {
    final message = await _mPaymentHelper.processTransaction(transaction);
    return Future.value(message);
  }
}

class ReturnBikeDataSet {
  ReturnBikeDataSet() {
    init = false;
  }

  bool init;
  Bike bikeRented;
  List<Station> listStation;
}
