import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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
            const CircularProgressIndicator(),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
