import 'package:ecobike_rental/entity/payment/credit_card.dart';
import 'package:state_notifier/state_notifier.dart';

import '../common/exception/payment.dart';
import '../common/exception/unrecognized.dart';
import '../entity/bike/bike.dart';
import '../entity/rental/rental.dart';
import '../subsystem/interbank_interface.dart';
import '../subsystem/interbank_subsystem.dart';
import '../ultils/config.dart';

/// Class giúp xử lí logic và cung cấp dữ liệu cho màn hình Payment Screen
/// @author duchdtran
class PaymentController extends StateNotifier<PaymentDataSet>
    with LocatorMixin {
  PaymentController(bikeId)
      : super(PaymentDataSet()) {
    _bikeId = bikeId;
  }

  int _bikeId;

  InterbankInterface _interbank;

  /// Khởi tạo dữ liệu cho màn hình payment screen
  Future<void> initDataSet() async {
    final newState = PaymentDataSet()
      ..listCard = state.listCard
      ..bike = await Bike().getBike(_bikeId)
      ..paymentChoose = state.paymentChoose
      ..init = true;

    state = newState;
  }

  /// Thanh toán
  /// @transaction nội dung thanh toán
  /// @return thông báo gửi từ ngân hàng
  Future<Map<String, dynamic>> payOrder(int amount, String contents) async {
    final result = <String, dynamic>{};
    result['result'] = false;
    try {
      final card = state.listCard[state.paymentChoose];
      _interbank = InterbankSubsytem();
      await _interbank.payOrder(card, amount, contents);

      result['result'] = true;
      result['message'] = 'Thanh toán thành công';
    } on PaymentException catch (e) {
      result['message'] = e.toString();
    } on UnrecognizedException catch (e) {
      result['message'] = e.toString();
    }
    return Future.value(result);
  }

  ///Thuê xe
  ///@bikeId mã xe
  ///@deposit tiền đặt cọc
  Future<void> rentBike(int bikeId, int deposit) async {
    await Rental().rentBike(Configs.DEVICE_CODE, bikeId, deposit);
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
  Future<void> addPaymentMethod(CreditCard cardInfo) {
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
    listCard = [CreditCard('118609_group4_2020', 'Group 4', 228, 1125)];
  }

  bool init;
  List<CreditCard> listCard;
  Bike bike;
  int paymentChoose;
}
