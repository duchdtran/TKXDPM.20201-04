import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          _buildPaymentMethodWidget(title: 'Visa - 4321', method: PaymentMethod.visa),
          _buildPaymentMethodWidget(title: 'Paypal - test123@gmail.com', method: PaymentMethod.paypal),
          _buildAddPaymentMethodWidget(),
          SizedBox(
            height: 10,
          ),
          _buildConfirmPaymentWidget(),
          SizedBox(
            height: 10,
          ),
          Text(
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


  Widget _buildPaymentMethodWidget({String title, PaymentMethod method, Color color = Colors.white}) {
    PaymentMethod _paymentMethod = PaymentMethod.visa;
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

  Widget _buildConfirmPaymentWidget() {
    return Container(
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
    );
  }
}
enum PaymentMethod { visa, paypal }
