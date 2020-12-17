import 'package:flutter/material.dart';

import 'ui/start/start.dart';

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
        accentColor: const Color(0xFF03DA91),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartScreen.withDependency(),
    );
  }
}
