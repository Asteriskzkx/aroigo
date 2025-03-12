import 'package:aroigo/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
