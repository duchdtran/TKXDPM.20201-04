import 'dart:async';

import 'package:ecobike_rental/entity/bike/double_bike.dart';
import 'package:ecobike_rental/entity/bike/electric_bike.dart';
import 'package:ecobike_rental/entity/bike/single_bike.dart';
import 'package:ecobike_rental/views/screen/scanner/scanner.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../controller/home.dart';
import '../../../entity/bike/bike.dart';
import '../../../entity/station/station.dart';
import '../station/station.dart';
import 'component/bottom_nav.dart';
import 'component/search_bar.dart';
import 'component/station_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen(this.listStation);

  List<Station> listStation;

  @override
  State<StatefulWidget> createState() => _HomeScreenState(listStation);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState(this.listStation);
  List<Station> listStation;
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
        if ((showSingleBikeOnly && bike.bikeType == SingleBike.BIKE_TYPE) ||
            (showDoubleBikeOnly && bike.bikeType == DoubleBike.BIKE_TYPE) ||
            (showElectricBikeOnly && bike.bikeType == ElectricBike.BIKE_TYPE)) {
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
                toggleFilter: (bikeType) {
                  switch (bikeType) {
                    case SingleBike.BIKE_TYPE:
                      {
                        setState(() {
                          showSingleBikeOnly = !showSingleBikeOnly;
                        });
                      }
                      break;

                    case DoubleBike.BIKE_TYPE:
                      {
                        setState(() {
                          showDoubleBikeOnly = !showDoubleBikeOnly;
                        });
                      }
                      break;

                    case ElectricBike.BIKE_TYPE:
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
                    itemCount: filteredStation.length,
                    itemBuilder: (context, index) {
                      return Builder(
                        builder: (context) {
                          return StationItem(
                            filteredStation[index],
                            onPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    StationScreen.withDependency(
                                        filteredStation[index].id),
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
      bottomNavigationBar: BottomNav(context, () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QRScannerScreen.withDependency()));
      }),
    );
  }
}
