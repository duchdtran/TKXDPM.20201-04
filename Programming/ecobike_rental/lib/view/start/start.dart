import 'package:flutter/material.dart';

import '../home/home.dart';
import '../widget/app_button.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 215,
            width: 215,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Chào mừng đến Ecobike Rental',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Ứng dụng thuê xe trong khu vực công viên Ecopark'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(
              title: 'Bắt đầu',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home.withDependency()),
                );
              },
            ),
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }
}
