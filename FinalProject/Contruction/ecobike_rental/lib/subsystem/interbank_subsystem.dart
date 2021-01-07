import 'package:ecobike_rental/entity/payment/credit_card.dart';
import 'package:ecobike_rental/entity/payment/payment_transaction.dart';

import 'interbank/interbank_subsytem_controller.dart';
import 'interbank_interface.dart';

class InterbankSubsytem extends InterbankInterface {
  InterbankSubsytem() {
    _ctrl = InterbankSubsystemController();
  }

  InterbankSubsystemController _ctrl;

  @override
  Future<PaymentTransaction> payOrder(
      CreditCard card, int amount, String contents) async {
    final transaction = await _ctrl.payOrder(card, amount, contents);
    return Future.value(transaction);
  }

  @override
  Future<PaymentTransaction> refund(
      CreditCard card, int amount, String contents) async {
    final transaction = await _ctrl.refund(card, amount, contents);
    return Future.value(transaction);
  }
}
