import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BikeInfoItem extends StatelessWidget {
  String label;
  String value;

  BikeInfoItem({@required this.label,@required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2.0,
          color: Colors.blue,
        ),
      ),
      child: Column(
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }
}
