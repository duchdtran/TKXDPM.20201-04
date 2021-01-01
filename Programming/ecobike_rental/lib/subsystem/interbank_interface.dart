import 'package:ecobike_rental/model/credit_card.dart';

import '../model/payment_transaction.dart';

abstract class InterbankInterface{
  Future<PaymentTransaction> payOrder(CreditCard card, int amount, String contents);
  Future<PaymentTransaction> refund(CreditCard card, int amount, String contents);
}