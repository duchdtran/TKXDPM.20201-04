import 'package:flutter/material.dart';

class BikeInfoItem extends StatelessWidget {
  const BikeInfoItem({@required this.label,@required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
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
