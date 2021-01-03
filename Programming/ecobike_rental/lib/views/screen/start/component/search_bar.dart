import 'package:flutter/material.dart';

import '../../../../entity/bike/bike.dart';
import 'traffic.dart';

Widget SearchBar({Function onTap, Function(int bikeType) toggleFilter, bool showSingleBikeOnly, bool showDoubleBikeOnly, bool showElectricBikeOnly}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
              ),
            ],
            color: Colors.white,
          ),
          width: double.infinity,
          height: 50,
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                width: 30,
              ),
              const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Tìm kiếm',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Traffic('Xe đạp đơn', Icons.directions_bike, showSingleBikeOnly, () {toggleFilter(Bike.SINGLE_BIKE);}),
            Traffic('Xe đạp đôi', Icons.directions_bike, showDoubleBikeOnly, (){toggleFilter(Bike.DOUBLE_BIKE);}),
            Traffic('Xe đạp điện', Icons.directions_bike, showElectricBikeOnly, (){toggleFilter(Bike.ELECTRIC_BIKE);}),
          ],
        ),
      )
    ],
  );
}
