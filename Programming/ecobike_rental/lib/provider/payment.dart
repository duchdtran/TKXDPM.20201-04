import 'package:state_notifier/state_notifier.dart';

import '../helper/api/request/transaction.dart';
import '../helper/bike.dart';
import '../helper/payment.dart';
import '../helper/rental.dart';
import '../model/bike.dart';
import '../model/card.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Payment Screen
/// @author duchdtran
class PaymentProvider extends StateNotifier<PaymentDataSet> with LocatorMixin {
  PaymentProvider(bikeId, paymentHelper, bikeHelper, rentalHelper) : super(PaymentDataSet()) {
    _bikeId = bikeId;
    _mPaymentHelper = paymentHelper;
    _mBikeHelper = bikeHelper;
    _mRentalHelper = rentalHelper;
  }

  int _bikeId;

  IPaymentHelper _mPaymentHelper;
  IBikeHelper _mBikeHelper;
  IRentalHelper _mRentalHelper;

  /// Khởi tạo dữ liệu cho màn hình payment screen
  Future<void> initDataSet() async {
    final newState = PaymentDataSet()
      ..listCard = state.listCard
      ..bike = await _mBikeHelper.getBike(_bikeId)
      ..paymentChoose = state.paymentChoose
      ..init = true;

    state = newState;
  }

  /// Thanh toán
  /// @transaction nội dung thanh toán
  /// @return thông báo gửi từ ngân hàng
  Future<String> processTransaction(TransactionRequest transaction) async {
    final message = await _mPaymentHelper.processTransaction(transaction);
    return Future.value(message);
  }

  ///Thuê xe
  ///@bikeId mã xe
  ///@deposit tiền đặt cọc
  Future<void> rentBike(int bikeId, int deposit) async {
    await _mRentalHelper.rentBike(bikeId, deposit);
  }

  ///Lựa chọn phương thức thanh toán
  ///@index vị trí của phương thức thanh toán
  Future<void> selectPaymentMethod(int index) async {
    if (index < 0 || index >= state.listCard.length) {
      return Future.error('');
    }
    state.paymentChoose = index;
    await initDataSet();
  }

  ///Thêm phương thức thanh toán
  ///@cardInfo thông tin thẻ mới được thêm
  Future<void> addPaymentMethod(CardInfo cardInfo) {
    final newState = state;
    newState.listCard.add(cardInfo);
    state = newState;
  }
}


/// Class chứa dữ liệu cho màn hình Payment Screen
/// @author duchdtran
class PaymentDataSet {
  PaymentDataSet() {
    init = false;
    paymentChoose = 0;
    listCard = [
      CardInfo(
          cardCode: '118609_group4_2020',
          owner: 'Group 4',
          cvvCode: 228,
          dateExpired: 1125)
    ];
  }

  bool init;
  List<CardInfo> listCard;
  Bike bike;
  int paymentChoose;
}
