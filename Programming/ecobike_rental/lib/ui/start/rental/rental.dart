import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../model/core/cores.dart';
import '../../../model/service/network/request/transaction.dart';
import '../../../provider/providers.dart';
import '../../dialog.dart';
import '../../scanner/scanner.dart';
import '../../widget/app_button.dart';
import '../../widget/bike_info_item.dart';
import '../component/component.dart';
import '../start.dart';

// ignore: must_be_immutable
class RentalScreen extends StatefulWidget {
  RentalScreen(this.listStation);
  List<Station> listStation;

  @override
  _RentalScreenState createState() => _RentalScreenState();
}

class _RentalScreenState extends State<RentalScreen> {
  bool _isCollapse = true;

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
            onPressed: () {
              setState(() {
                _isCollapse = !_isCollapse;
              });
            },
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(_isCollapse ? 280 : 0),
          child: Visibility(
            visible: _isCollapse,
            child: _buildRentBike(context),
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
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: buildSearchBarWidget(),
          ),
          Positioned(
              bottom: (_isCollapse) ? 20 : 220,
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
              visible: !_isCollapse,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Chọn địa điểm trả xe',
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
                      itemCount: widget.listStation.length,
                      itemBuilder: (_, index) {
                        return Builder(
                          builder: (_) {
                            return buildStationItem(
                              widget.listStation[index],
                              onPress: () async {
                                final money = await context
                                    .read<HomeProvider>()
                                    .returnBike();
                                final transaction = TransactionRequest(
                                  owner: 'Group 4',
                                  createdAt: '2020-11-12 10:55:26',
                                  amount: money,
                                  cvvCode: '228',
                                  dateExpired: '1125',
                                  cardCode: '118609_group4_2020',
                                  transactionContent: 'Trả tiền thuê xe',
                                  command: 'pay',
                                );
                                await context
                                    .read<PaymentProvider>()
                                    .processTransaction(transaction);
                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CustomDialogBox(
                                      title:
                                          "Chúc mừng bạn đã trả xe thành công",
                                      onPress: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => StartScreen
                                                  .withDependency())),
                                    );
                                  },
                                );
                              },
                            );
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
                  child: _buildContainer('Phí thuê', '${bike.costHourlyRent}/h', Colors.yellow),
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
                      _buildContainer('Thời gian', "0h 0' 0\"", Colors.blue),
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
            onPressed: () {
              setState(() {
                _isCollapse = !_isCollapse;
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

  Widget _buildBottomWidget() {
    return Container(
      height: 80,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: AppButton(
            icon: Icons.lock,
            title: 'Khóa xe',
            onPress: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => QRScannerScreen()));
            },
          ),
        ),
      ),
    );
  }
}
