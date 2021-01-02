import 'dart:convert';

import 'package:ecobike_rental/entity/payment/credit_card.dart';
import 'package:ecobike_rental/entity/payment/payment_transaction.dart';

import '../../common/exception/internal_server_error.dart';
import '../../common/exception/invalid_card.dart';
import '../../common/exception/invalid_transaction_amount.dart';
import '../../common/exception/invalid_version.dart';
import '../../common/exception/not_enough_balance.dart';
import '../../common/exception/not_enough_transaction_info.dart';
import '../../common/exception/suspicious_transaction.dart';
import '../../common/exception/unrecognized.dart';
import '../../ultils/config.dart';
import '../../ultils/ultis.dart';
import 'interbank_boundary.dart';

class InterbankSubsystemController {
  static const String _appCode = 'AnUHgieijc4=';
  static const String _secretKey = 'BcvsSCIF4ho=';
  static const String _refundCommand = 'refund';
  static const String _payCommand = 'pay';
  static const String _version = '1.0.1';

  static InterbankBoundary interbankBoundary = InterbankBoundary();

  Future<PaymentTransaction> refund(
      CreditCard card, int amount, String contents) async {
    final transaction =
        await processTransaction(_refundCommand, card, amount, contents);
    return Future.value(transaction);
  }

  Future<PaymentTransaction> payOrder(
      CreditCard card, int amount, String contents) async {
    final transaction =
        await processTransaction(_payCommand, card, amount, contents);
    return Future.value(transaction);
  }

  Future<PaymentTransaction> processTransaction(
      String command, CreditCard card, int amount, String contents) async {
    final cardJson = card.toJson();

    final transaction = <String, dynamic>{};

    transaction['owner'] = cardJson['owner'];
    transaction['createdAt'] = Utils.getToday();
    transaction['amount'] = amount;
    transaction['cvvCode'] = cardJson['cvvCode'];
    transaction['dateExpired'] = cardJson['dateExpired'];
    transaction['cardCode'] = cardJson['cardCode'];
    transaction['transactionContent'] = contents;
    transaction['command'] = command;

    final hashCodeString = <String, dynamic>{};
    hashCodeString['secretKey'] = _secretKey;
    transaction.forEach((key, value) => hashCodeString[key] = value);

    final md5 = Utils.generateMd5(json.encode(hashCodeString));

    final requestMap = <String, dynamic>{};
    requestMap['hashCode'] = md5;
    requestMap['transaction'] = transaction;
    requestMap['appCode'] = _appCode;
    requestMap['version'] = _version;

    final responseText = await interbankBoundary.query(
        Configs.PROCESS_TRANSACTION_URL, json.encode(requestMap));

    Map<String, dynamic> response;
    try {
      response = json.decode(responseText);
    } on Exception {
      throw UnrecognizedException();
    }

    final paymentTransaction = await makePaymentTransaction(response);

    return Future.value(paymentTransaction);
  }

  Future<PaymentTransaction> makePaymentTransaction(
      Map<String, dynamic> response) {
    if (response == null) {
      return Future.error(null);
    }

    switch (response['errorCode']) {
      case '00':
        break;
      case '01':
        throw InvalidCardException();
        break;
      case '02':
        throw NotEnoughBalanceException();
        break;
      case '03':
        throw InternalServerErrorException();
        break;
      case '04':
        throw SuspiciousTransactionException();
        break;
      case '05':
        throw NotEnoughTransactionInfoException();
        break;
      case '06':
        throw InvalidVersionException();
        break;
      case '07':
        throw InvalidTransactionAmountException();
        break;
      default:
        throw UnrecognizedException();
        break;
    }

    final trans = PaymentTransaction.fromJson(response['transaction']);

    return Future.value(trans);
  }
}
