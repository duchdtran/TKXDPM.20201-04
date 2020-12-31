import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../model/cores.dart';
import '../../../provider/providers.dart';
import '../../return_bike/return_bike.dart';
import '../../station/station.dart';
import '../../widget/bike_info_item.dart';
import '../component/component.dart';

// ignore: must_be_immutable
class RentalScreen extends StatelessWidget {
  RentalScreen(this.listStation);
  List<Station> listStation;

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    context.watch<HomeProvider>().initDataSet();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Ecobike Rental',
          style: TextStyle(color: Colors.blue),
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(280),
          child: _buildRentBike(context),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(20.962056, 105.925219),
              zoom: 15,
            ),
            onMapCreated: (controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: buildSearchBarWidget(),
          ),
          Positioned(
              bottom: 220,
              right: 10,
              child: SizedBox(
                width: 40,
                height: 40,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                  child: const Icon(
                    Icons.my_location,
                    color: Colors.black,
                  ),
                ),
              )),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Gần bạn',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    FlatButton(
                      onPressed: () {},
                      child: const Text(
                        'Xem thêm',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listStation.length,
                    itemBuilder: (_, index) {
                      return Builder(
                        builder: (_) {
                          return buildStationItem(
                            listStation[index],
                            onPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StationScreen.withDependency(
                                        listStation[index].id),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomWidget(context),
    );
  }

  Container _buildRentBike(BuildContext context) {
    final bike = context.select<HomeDataSet, Bike>((value) => value.bike);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const Divider(
            height: 3,
          ),
          SizedBox(
            width: double.infinity,
            height: 170,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 30,
                  child: _buildContainer(
                      'Phí thuê', '${bike.costHourlyRent}/h', Colors.yellow),
                ),
                Positioned(
                  top: 20,
                  right: 30,
                  child: _buildContainer(
                      'Tổng tiền', '123.000đ', Colors.greenAccent),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: _buildContainer('Thời gian', "0h 0' 0\"", Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text('Thông tin xe'),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ReturnBikeScreen.withDependency())),
                  child: const Text(
                    'Hướng dẫn trả xe',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              BikeInfoItem(
                label: 'Biển số xe',
                value: bike.licensePlates,
              ),
              const BikeInfoItem(
                label: 'Lượng pin',
                value: '37%',
              ),
              const BikeInfoItem(
                label: 'Thời gian còn lại',
                value: '37 phút',
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_up),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(String label, String value, Color borderColor) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          width: 4,
          color: borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
