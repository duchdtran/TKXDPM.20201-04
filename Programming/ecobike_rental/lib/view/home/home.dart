import 'dart:async';

import 'package:ecobike_rental/view/app_button.dart';
import 'package:ecobike_rental/view/bike_info_item.dart';
import 'package:ecobike_rental/view/scanner/scanner.dart';
import 'package:ecobike_rental/view/station/station.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  bool _isRent = true;
  Home();
  Home.withRented() {
    _isRent = false;
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _userTap = false;

  final Completer<GoogleMapController> _controller = Completer();

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
                widget._isRent = !widget._isRent;
              });
            },
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
        bottom: PreferredSize(
            child: Visibility(
              visible: !widget._isRent,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Divider(
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
                                'Phí thuê', '15.000/h', Colors.yellow),
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
                            child: _buildContainer(
                                'Thời gian', "1h 45' 27\"", Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Thông tin xe'),
                          Text(
                            'Hướng dẫn trả xe',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BikeInfoItem(
                          label: 'Biển số xe',
                          value: '34M6-9863',
                        ),
                        BikeInfoItem(
                          label: 'Lượng pin',
                          value: '37%',
                        ),
                        BikeInfoItem(
                          label: 'Thời gian còn lại',
                          value: '37 phút',
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_up),
                      onPressed: () {
                        setState(() {
                          widget._isRent = !widget._isRent;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(widget._isRent ? 0 : 280)),
      ),
      body: Stack(
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
              setState(() {
                _userTap = true;
              });
            },
            onCameraIdle: () {
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
              bottom: (_userTap | !widget._isRent) ? 20 : 220,
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
              visible: !(_userTap | !widget._isRent),
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
                          return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Station())),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 250,
                              height: 120,
                              child: Image.network(
                                'https://i.pinimg.com/564x/b1/bc/3a/b1bc3a01ac9b8e70c4f11ef3b0c9cfae.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomWidget(),
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
          width: 4.0,
          color: borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
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
            icon: Icons.qr_code_scanner,
            onPress: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => QRScanner()));
            },
          ),
        ),
      ),
    );
  }
}
