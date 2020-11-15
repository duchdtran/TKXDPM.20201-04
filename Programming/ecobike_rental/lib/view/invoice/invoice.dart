import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home/home.dart';
import '../widget/gradien_icon.dart';

class Invoice extends StatelessWidget {
  // Invoice({Key key, this.deposits, this.time, this.cost})
  //     : super(key: key);

  int deposits = 200000;
  int time = 7000; // in seconds
  int cost = 142000;

  String timeToString(int time) {
    String hour = (time / 3600).toInt().toString();
    int remain = time % 3600;
    String minutes = (remain / 60).toInt().toString();
    String second = (remain % 60).toString();
    return hour + "h" + minutes + "m" + second + "s";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          margin: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 400,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 215,
                      width: 215,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Hi vọng bạn hài lòng về chuyến đi",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Tiền đặt cọc"),
                  Text(deposits.toString() + " đ"),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [Text("Tổng thời gian"), Text(timeToString(time))],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [Text("Chi phí"), Text(cost.toString() + " đ")],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Tiền trả lại",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (deposits - cost).toString() + " đ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              const Spacer()
            ],
          ),
        ),
      ]),
      const SizedBox(
        height: 100,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [Column(
            children: [
              Text("Đánh giá chuyến đi"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.star, color:Colors.blueAccent),
                  Icon(Icons.star, color:Colors.blueAccent),
                  Icon(Icons.star, color:Colors.blueAccent),
                  Icon(Icons.star, color:Colors.blueAccent),
                  Icon(Icons.star, color:Colors.blueAccent)
                ],
              )
            ],
          )
      ])
    ]);
  }
}
