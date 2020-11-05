import 'package:ecobike_rental/view/AppButton.dart';
import 'package:ecobike_rental/view/home/home.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
          ),
          FlutterLogo(
            size: 215,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Chào mừng đến Ecobike Rental',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Ứng dụng thuê xe trong khu vực công viên Ecopark'),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(
              title: 'Bắt đầu',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ),
          SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }
}
