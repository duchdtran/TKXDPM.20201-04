import 'package:flutter/material.dart';

import '../../../model/core/cores.dart';

Widget buildSearchBarWidget({Function onTap}) {
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
            _buildTrafficWidget('Xe đạp đơn', Icons.directions_bike),
            _buildTrafficWidget('Xe đạp đôi', Icons.directions_bike),
            _buildTrafficWidget('Xe đạp điện', Icons.directions_bike),
          ],
        ),
      )
    ],
  );
}

Widget _buildTrafficWidget(String title, IconData icon) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Colors.black.withOpacity(0.7)),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
            ),
          ],
        ),
      ));
}

Widget buildStationItem(Station station, {Function onPress}) {
  return InkWell(
    onTap: onPress,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
          image: DecorationImage(
              image: NetworkImage(station.image), fit: BoxFit.fill)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 250,
      height: 120,
      child: Center(
        child: Text('${station.contactName}'),
      ),
    ),
  );
}
