import 'dart:async';

import 'package:ecobike_rental/model/core/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../model/core/station.dart';
import '../../provider/home.dart';
import '../list_station/list_station.dart';
import '../loading/loading.dart';
import '../scanner/scanner.dart';
import '../station/station.dart';
import '../widget/app_button.dart';
import '../widget/bike_info_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen._({Key key}) : super(key: key);

  static Widget withDependency() {
    return StateNotifierProvider<HomeProvider, HomeDataSet>(
      create: (_) => HomeProvider(),
      child: HomeScreen._(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _userTap = false;
  bool _isRented = false;

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    context.watch<HomeProvider>().initDataSet();

    return Selector<HomeDataSet, bool>(
      builder: (context, data, child) {
        if (!data) {
          return Center(child: LoadingScreen());
        } else {
          final listStation = context
              .select<HomeDataSet, List<Station>>((ds) => ds.listStation);
          final _rental =
              context.select<HomeDataSet, Rental>((ds) => ds.rental);
          _isRented = _rental != null;
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
                  onPressed: () {
                    setState(() {
                      _isRented = !_isRented;
                    });
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(_isRented ? 280 : 0),
                child: Visibility(
                  visible: _isRented,
                  child: _buildRentBike(),
                ),
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
                    bottom: (_userTap | _isRented) ? 20 : 220,
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
                  child: Visibility(
                    visible: !(_userTap | _isRented),
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
                                  return _buildStationItem(listStation[index]);
                                },
                              );
                            },
                          ),
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
      },
      selector: (buildContext, ds) => ds.init,
    );
  }

  Container _buildRentBike() {
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
                  child: _buildContainer('Phí thuê', '15.000/h', Colors.yellow),
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
                  child:
                      _buildContainer('Thời gian', "1h 45' 27\"", Colors.blue),
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
                const Text(
                  'Hướng dẫn trả xe',
                  style: TextStyle(color: Colors.blue),
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
              const BikeInfoItem(
                label: 'Biển số xe',
                value: '34M6-9863',
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
            onPressed: () {
              setState(() {
                _isRented = !_isRented;
              });
            },
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

  Widget _buildSearchBarWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListStation(),
            ),
          ),
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => QRScannerScreen()));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStationItem(Station station) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StationScreen.withDependency(
            station.id,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 250,
        height: 120,
        child: Center(
          child: Text('${station.stationName}'),
        ),
      ),
    );
  }
}
