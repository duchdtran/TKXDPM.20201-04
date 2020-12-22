import 'package:state_notifier/state_notifier.dart';

import '../model/core/cores.dart';
import '../model/helper/helpers.dart';
import '../model/service/network/request/transaction.dart';

///
///Cung cấp dữ liệu và xử lí logic cho màn hình Payment
///
class PaymentProvider extends StateNotifier<PaymentDataSet> with LocatorMixin {
  PaymentProvider(this._bikeId) : super(PaymentDataSet()) {
    _mPaymentHelper = PaymentHelper();
    _mBikeHelper = BikeHelper();
    _mRentalHelper = RentalHelper();
  }

  final int _bikeId;

  PaymentHelper _mPaymentHelper;
  BikeHelper _mBikeHelper;
  RentalHelper _mRentalHelper;

  Future<void> initDataSet() async {
    final newState = PaymentDataSet()
      ..listCard = state.listCard
      ..bike = await _mBikeHelper.getBike(_bikeId)
      ..paymentChoose = state.paymentChoose
      ..init = true;

    state = newState;
  }

  Future<void> processTransaction(TransactionRequest transaction) async{
    await _mPaymentHelper.processTransaction(transaction);
  }

   Future<void> rentBike(int bikeId, int deposit) async{
    await _mRentalHelper.rentBike(bikeId, deposit);
  }

  Future<void> selectPaymentMethod(int index) async {
    if (index < 0 || index >= state.listCard.length) {
      return Future.error('');
    }
    state.paymentChoose = index;
    await initDataSet();
  }

  Future<void> addPaymentMethod(CardInfo cardInfo){
    final newState = state;
    newState.listCard.add(cardInfo);
    state = newState;
  }
}

class PaymentDataSet {
  PaymentDataSet() {
    init = false;
    paymentChoose = 0;
    listCard = [];
  }

  bool init;
  List<CardInfo> listCard;
  Bike bike;
  int paymentChoose;
}
