import 'package:flutter/material.dart';
import 'data/db/database.dart';
import 'dart:convert';

import 'data/model/station.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var station = new Station(
    stationName: 'Bãi gửi xe đảo cọ',
    area: 45.6,
    email: 'test123@gmail.com',
    phone: '0868330147',
  );
  await DatabaseImp.insert(station);
  var stations = await Station.getListStation();
  stations.forEach((element) {
    debugPrint(element.toMap().toString());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF0087EE),
        accentColor: const Color(0xFF03DA91),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
