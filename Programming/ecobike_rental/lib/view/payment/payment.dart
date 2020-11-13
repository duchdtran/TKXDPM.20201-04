import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dialog.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ],
        ),
      ),
      height: 350,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
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
          _buildPaymentMethodWidget(
              title: 'Visa - 4321', method: PaymentMethod.visa),
          _buildPaymentMethodWidget(
              title: 'Paypal - test123@gmail.com',
              method: PaymentMethod.paypal),
          _buildAddPaymentMethodWidget(),
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

  Widget _buildAddPaymentMethodWidget() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
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
      {String title, PaymentMethod method, Color color = Colors.white}) {
    var _paymentMethod = PaymentMethod.visa;
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.payment,
              color: color,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              title,
              style: TextStyle(color: color),
            )),
            Theme(
              data: ThemeData(unselectedWidgetColor: color),
              child: Radio(
                value: method,
                groupValue: _paymentMethod,
                activeColor: color,
                onChanged: (PaymentMethod value) {
                  _paymentMethod = value;
                },
              ),
            )
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
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'Custom Dialog Demo',
              descriptions:
                  'Hii all this is a custom dialog in flutter and  you will be use in your flutter applications',
              text: 'Yes',
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  children: [
                    Text(
                      'Đặt cọc',
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
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
            Expanded(
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

enum PaymentMethod { visa, paypal }