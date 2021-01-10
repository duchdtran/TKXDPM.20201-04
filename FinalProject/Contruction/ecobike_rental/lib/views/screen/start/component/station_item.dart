import 'package:ecobike_rental/entity/bike/bike.dart';
import 'package:ecobike_rental/entity/bike/double_bike.dart';
import 'package:ecobike_rental/entity/bike/electric_bike.dart';
import 'package:ecobike_rental/entity/bike/single_bike.dart';
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
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              right: 10,
              top: 10,
              child: Column(
                children: [
                  _buildBikeCountItem(
                      icon: Icons.directions_bike, countBike: station.getListBikeByType(SingleBike.BIKE_TYPE).length),
                  const SizedBox(height: 4,),
                  _buildBikeCountItem(
                      icon: Icons.directions_bike, countBike: station.getListBikeByType(DoubleBike.BIKE_TYPE).length),
                  const SizedBox(height: 4,),
                  _buildBikeCountItem(
                      icon: Icons.directions_bike, countBike: station.getListBikeByType(ElectricBike.BIKE_TYPE).length),
                ],
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: Row(
                children: [
                  const Icon(Icons.aspect_ratio_sharp, color: Colors.white,),
                  const SizedBox(width: 4,),
                  Text('${station.area}m2', style: const TextStyle(color: Colors.white),),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Column(
                children: [
                  const Text(
                    'Bãi xe',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '${station.stationName}(${station.calculateDistanceRenter().toStringAsFixed(0)}m)',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildBikeCountItem({IconData icon, int countBike}) {
  return Row(
    children: [
      Icon(icon, color: Colors.white, size: 16,),
      const SizedBox(width: 10,),
      Text(countBike.toString(), style: const TextStyle(color: Colors.white),),
    ],
  );
}
