import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../controller/home.dart';
import '../../../entity/bike/bike.dart';
import '../../../entity/invoice/invoice.dart';
import '../../../entity/station/station.dart';
import '../../dialog/dialog.dart';
import '../../widget/bike_info_item.dart';
import '../return_bike/return_bike.dart';
import 'component/bottom_nav.dart';
import 'component/search_bar.dart';
import 'component/station_item.dart';

// ignore: must_be_immutable
class RentalScreen extends StatefulWidget {
  RentalScreen(this.listStation);
  List<Station> listStation;

  @override
  State<StatefulWidget> createState() => _RentalScreenState(listStation);
}

class _RentalScreenState extends State<RentalScreen> {
  _RentalScreenState(this.listStation);
  List<Station> listStation;
  bool showRentalBike = true;
  bool showSingleBikeOnly = false;
  bool showDoubleBikeOnly = false;
  bool showElectricBikeOnly = false;

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    context.watch<HomeController>().initDataSet();
    final filteredStation = listStation.where((station) {
      if (!showSingleBikeOnly && !showDoubleBikeOnly && !showElectricBikeOnly) {
        return true;
      }

      for (final bike in station.bikes) {
        if ((showSingleBikeOnly && bike.bikeType == Bike.SINGLE_BIKE) ||
            (showDoubleBikeOnly && bike.bikeType == Bike.DOUBLE_BIKE) ||
            (showElectricBikeOnly && bike.bikeType == Bike.ELECTRIC_BIKE)) {
          return true;
        }
      }
      return false;
    }).toList();

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
            onPressed: () {
              showRentalBike = !showRentalBike;
            },
            icon: const Icon(
              Icons.directions_bike,
              color: Colors.black,
            ),
          ),
        ],
        bottom: showRentalBike
            ? PreferredSize(
                preferredSize: const Size.fromHeight(290),
                child: _buildRentBike(context),
              )
            : null,
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
            child: SearchBar(
                showSingleBikeOnly: showSingleBikeOnly,
                showDoubleBikeOnly: showDoubleBikeOnly,
                showElectricBikeOnly: showElectricBikeOnly,
                toggleFilter: (int bikeType) {
                  switch (bikeType) {
                    case Bike.SINGLE_BIKE:
                      {
                        setState(() {
                          showSingleBikeOnly = !showSingleBikeOnly;
                        });
                      }
                      break;

                    case Bike.DOUBLE_BIKE:
                      {
                        setState(() {
                          showDoubleBikeOnly = !showDoubleBikeOnly;
                        });
                      }
                      break;

                    case Bike.ELECTRIC_BIKE:
                      {
                        setState(() {
                          showElectricBikeOnly = !showElectricBikeOnly;
                        });
                      }
                      break;
                  }
                }),
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
                    itemCount: filteredStation.length,
                    itemBuilder: (_, index) {
                      return Builder(
                        builder: (_) {
                          return StationItem(
                            filteredStation[index],
                            onPress: () => showDialog(
                                context: context,
                                child: CustomDialogBox(
                                  title: 'Vui lòng trả lại xe đang thuê',
                                )),
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
      bottomNavigationBar: BottomNav(
        context,
        () => showDialog(
          context: context,
          child: CustomDialogBox(
            title: 'Vui lòng trả lại xe đang thuê',
          ),
        ),
      ),
    );
  }

  Container _buildRentBike(BuildContext context) {
    final bike = context.select<HomeDataSet, Bike>((value) => value.bike);
    final invoice =
        context.select<HomeDataSet, Invoice>((value) => value.invoice);
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
                  top: 10,
                  left: 30,
                  child: _buildContainer(
                      'Phí thuê', '${bike.costHourlyRent}/h', Colors.yellow),
                ),
                Positioned(
                  top: 10,
                  right: 30,
                  child: _buildContainer('Tổng tiền',
                      "${invoice.fee} đ", Colors.greenAccent),
                ),
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: _buildContainer('Thời gian',
                      '${invoice.minutes}p', Colors.blue),
                ),
              ],
            ),
          ),
          Text('Xe đang thuê: ${bike.bikeName}'),
          const SizedBox(height: 10,),
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
                    'Trả xe',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              BikeInfoItem(
                label: 'Biển số xe',
                value: bike.licensePlates,
              ),
              BikeInfoItem(
                label: 'Mã xe',
                value: bike.id.toString(),
              ),
              Visibility(
                visible: bike.toJson()['batterCapacity'] != null,
                child: BikeInfoItem(
                  label: 'Lượng pin',
                  value: '${bike.toJson()['batterCapacity']}%',
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_up),
            onPressed: () {
              showRentalBike = false;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(String label, String value, Color borderColor) {
    return Container(
      width: 120,
      height: 120,
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
