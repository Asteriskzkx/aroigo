import 'package:aroigo/screens/homescreen_navi.dart';
import 'package:aroigo/widgets/order_tracking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => OrderTrackingProvider(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return OrderPopupOverlay(child: child!);
        },
        home: HomescreenNavi(),
      ),
    ),
  );
}
