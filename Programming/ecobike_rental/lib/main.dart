import 'package:flutter/material.dart';

<<<<<<< HEAD
import 'view/start/start.dart';
import 'controller/list_station.dart';

=======
import 'ui/start/start.dart';
>>>>>>> 297ef02e597f3bce87d9701601047650b2582212

void main() {
  runApp(MyApp());
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
        accentColor:  const Color(0xFF03DA91),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartScreen(),
    );
  }
}

