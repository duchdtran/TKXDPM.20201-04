import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../model/core/cores.dart';
import '../../widget/app_button.dart';
import '../component/component.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.listStation);

  final List<Station> listStation;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
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
        ],
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
              bottom: 20,
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
                    itemBuilder: (context, index) {
                      return Builder(
                        builder: (context) {
                          return buildStationItem(listStation[index]);
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
      bottomNavigationBar: _buildBottomWidget(onPress: () {}),
    );
  }

  Widget _buildBottomWidget({Function onPress}) {
    return Container(
      height: 80,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: AppButton(
            title: 'Quét mã để thuê xe',
            icon: Icons.qr_code_scanner,
            onPress: onPress,
          ),
        ),
      ),
    );
  }
}
