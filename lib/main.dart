import 'package:aroigo/screens/foodscreen_new.dart';
import 'package:aroigo/screens/homescreen.dart';
import 'package:aroigo/screens/homescreen_navi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: HomescreenNavi(),
    ),
  );
}
