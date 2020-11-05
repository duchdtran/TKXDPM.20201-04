import 'dart:async';

import 'package:ecobike_rental/view/AppButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _userTap = false;
  bool _rentBike = true;

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Ecobike Rental',
          style: TextStyle(color: Colors.blue),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _rentBike = !_rentBike;
              });
            },
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Visibility(
              visible: !_rentBike,
              child: Container(
                width: double.infinity,
                height: 200,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Stack(
                        children: [_buildContainer()],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(20.962056, 105.925219),
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  onCameraMove: (position) {
                    debugPrint('on cam moce');
                    setState(() {
                      _userTap = true;
                    });
                  },
                  onCameraIdle: () {
                    debugPrint('on cam idle');
                    _userTap = false;
                  },
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: _buildSearchBarWidget(),
                ),
                Positioned(
                    bottom: (_userTap | !_rentBike) ? 20 : 200,
                    right: 10,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: Icon(
                          Icons.my_location,
                          color: Colors.black,
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Visibility(
                    visible: !(_userTap | !_rentBike),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Gần bạn',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
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
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: 250,
                                  height: 120,
                                  color: Colors.grey,
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomWidget(),
    );
  }

  Widget _buildContainer(){
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text('àasf'),
      ),
    );
  }
  Widget _buildSearchBarWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
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
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Tìm kiếm',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildTraficWidget('Xe đạp đơn', Icons.directions_bike),
              _buildTraficWidget('Xe đạp đôi', Icons.directions_bike),
              _buildTraficWidget('Xe đạp điện', Icons.directions_bike),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTraficWidget(String title, IconData icon) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Icon(icon, size: 16, color: Colors.black.withOpacity(0.7)),
              SizedBox(
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

  Widget _buildBottomWidget() {
    return Container(
      height: 80,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: AppButton(
            title: 'Quét mã để thuê xe',
            icon: Icons.scanner,
            onPress: () {},
          ),
        ),
      ),
    );
  }
}
