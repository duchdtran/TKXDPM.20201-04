import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pin_view/pin_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../bike/bike.dart';
import '../payment/payment.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String qrText = '';
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Quét mã QR để thuê xe',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderRadius: 5,
              borderLength: 30,
              borderWidth: 8,
              cutOutSize: 300,
            ),
          ),
          const Positioned(
            top: 100,
            left: 80,
            right: 80,
            child: Text(
              'Quét mã QR trên xe sử dụng máy ảnh trên điện thoại của bạn',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 45,
            right: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    height: 2,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Hoặc',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context, scrollController) =>
                      _buildPinCodeWidget(context),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.keyboard,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Nhập mã từ bàn phím',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
        debugPrint('QRCode: $qrText');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BikeScreen.withDependency(1)));
      });
    });
  }

  Widget _buildPinCodeWidget(context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Wrap(
        children: <Widget>[
          const Center(child: Text('Nhập mã phương tiện của xe')),
          PinView(
            count: 6,
            margin: const EdgeInsets.all(2.5),
            obscureText: false,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            dashStyle: const TextStyle(
                // dash style
                fontSize: 25,
                color: Colors.grey),
            submit: (pin) {
              debugPrint('Code pin: $pin');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BikeScreen.withDependency(1),
                ),
              );
              showMaterialModalBottomSheet(
                  context: context,
                  builder: (context, scrollController) =>
                      PaymentScreen.withDependency(1));
            },
          ),
        ],
      ),
    );
  }
}
