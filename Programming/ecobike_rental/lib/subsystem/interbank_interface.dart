import 'package:ecobike_rental/entity/payment/credit_card.dart';
import 'package:ecobike_rental/entity/payment/payment_transaction.dart';


abstract class InterbankInterface{
  Future<PaymentTransaction> payOrder(CreditCard card, int amount, String contents);
  Future<PaymentTransaction> refund(CreditCard card, int amount, String contents);
}