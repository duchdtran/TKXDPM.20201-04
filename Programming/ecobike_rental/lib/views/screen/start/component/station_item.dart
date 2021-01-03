import 'package:flutter/material.dart';

import '../../../../entity/station/station.dart';

Widget StationItem(Station station, {Function onPress}) {
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          '${station.stationName}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}