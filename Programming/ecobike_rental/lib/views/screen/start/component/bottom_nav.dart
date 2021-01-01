import 'package:flutter/material.dart';

import '../../scanner/scanner.dart';
import '../../widget/widgets.dart';

Widget BottomNav(BuildContext context) {
  return Container(
    height: 80,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: AppButton(
          icon: Icons.qr_code_scanner,
          title: 'Quét mã QR để thuê xe',
          onPress: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => QRScannerScreen()));
          },
        ),
      ),
    ),
  );
}