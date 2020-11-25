import 'package:ecobike_rental/provider/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../add_payment/add_payment.dart';
import '../dialog.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen._({Key key}) : super(key: key);

  static Widget withDependency(int bikeId) {
    return StateNotifierProvider<PaymentProvider, PaymentDataSet>(
      create: (_) => PaymentProvider(bikeId),
      child: PaymentScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<PaymentProvider>().initDataSet();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Selector<PaymentDataSet, int>(
            builder: (context, data, child) {
              return Wrap(
                children: List.generate(
                  context.select<PaymentDataSet, int>(
                      (value) => value.listCard.length),
                  (index) => InkWell(
                    onTap: () => context
                        .read<PaymentProvider>()
                        .selectPaymentMethod(index),
                    child: _buildPaymentMethodWidget(
                      isCheck: data == index,
                      title: context.select<PaymentDataSet, String>(
                          (value) => value.listCard[index].paymentMethod),
                      subTitle: context.select<PaymentDataSet, String>(
                          (value) => value.listCard[index].cardCode),
                    ),
                  ),
                ),
              );
            },
            selector: (buildContext, ds) => ds.paymentChoose,
          ),
          _buildAddPaymentMethodWidget(context),
          const SizedBox(
            height: 10,
          ),
          _buildConfirmPaymentWidget(context),
          const SizedBox(
            height: 10,
          ),
          // ignore: lines_longer_than_80_chars
          const Text(
            'Để thuê xe bạn cần đặt cọc 40% giá trị xe, sau khi trả xe tiền cọc sẽ được trả lại tài khoản của bạn',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildAddPaymentMethodWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddPayment()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
                child: Text(
              'Thêm phương thức thanh toán',
              style: TextStyle(color: Colors.white),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodWidget(
      {String title,
      String subTitle,
      bool isCheck = false,
      Color color = Colors.white}) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.payment,
              color: color,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: title,
                  style: TextStyle(color: color),
                  children: [
                    const TextSpan(text: '-'),
                    TextSpan(text: subTitle),
                  ],
                ),
              ),
            ),
            Icon(
              isCheck
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.white,
            ),
          ],
        ),
        Divider(
          color: color,
        ),
      ],
    );
  }

  Widget _buildConfirmPaymentWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) {
            return CustomDialogBox();
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Đặt cọc',
                      style: TextStyle(fontSize: 10),
                    ),
                    const Text(
                      '100.000đ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey,
              width: 1,
              height: 25,
            ),
            const Expanded(
                flex: 7,
                child: Center(
                  child: Text(
                    'Xác nhận thanh toán',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
