import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../widget/app_button.dart';
import '../widget/gradient_icon.dart';

class InvoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hóa đơn'),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Hi vọng bạn hài lòng về chuyến đi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  _buildRowInFo('Tên xe', 'Xe Đạp Điện Pega Bike Zinger'),
                  _buildRowInFo('Loại xe', 'Xe đạp điện'),
                  _buildRowInFo('Thời gian thuê', '1 tiếng 10 phút'),
                  _buildRowInFo('Giá thuê 30 phút đầu', '10000đ'),
                  _buildRowInFo('Giá thuê theo giờ', '3000đ'),
                  _buildRowInFo('Chi phí thuê', '19000đ'),
                  _buildRowInFo('Tiền đặt cọc', '700000đ'),
                  const Divider(color: Colors.black,),
                  Row(
                    children: [
                      const Text('Tiền trả lại', style: TextStyle(fontWeight: FontWeight.bold),),
                      const Spacer(),
                      const Text('681000đ'),
                    ],
                  )

                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text('Đánh giá chuyến đi'),
            const SizedBox(
              height: 10,
            ),
            _buildRatingBar(context, 5),
            const SizedBox(
              height: 50,
            ),
            AppButton(title: 'Xác nhận thanh toán', onPress: () {})
          ],
        ),
      ),
    );
  }

  Widget _buildRowInFo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(label),
          const Spacer(),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildRatingBar(BuildContext context, double initRating) {
    return Wrap(
      children: List.generate(
        5,
        (index) => GradientIcon(
          Icons.star,
          20,
          LinearGradient(
            colors: <Color>[
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
