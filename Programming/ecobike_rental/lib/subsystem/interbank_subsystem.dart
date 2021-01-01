import '../model/credit_card.dart';
import '../model/payment_transaction.dart';
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
