import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../model/bike.dart';
import '../../model/station.dart';
import '../../provider/providers.dart';
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
    context.watch<HomeProvider>().initDataSet();
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
                    case Bike.SINGLE_BIKE: {
                      setState(() {
                        showSingleBikeOnly = !showSingleBikeOnly;
                      });
                    }
                    break;

                    case Bike.DOUBLE_BIKE: {
                      setState(() {
                        showDoubleBikeOnly = !showDoubleBikeOnly;
                      });
                    }
                    break;

                    case Bike.ELECTRIC_BIKE: {
                      setState(() {
                        showElectricBikeOnly = !showElectricBikeOnly;
                      });
                    }
                    break;
                  }

                }
            ),
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
      bottomNavigationBar: BottomNav(context),
    );
  }
}
