import 'package:aroigo/screens/homescreen.dart';
import 'package:flutter/material.dart';

class HomescreenNavi extends StatefulWidget {
  const HomescreenNavi({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomescreenNavi();
  }
}

class _HomescreenNavi extends State<HomescreenNavi> {
  int _selectedIndex = 0;

  final Map<int, Map<String, dynamic>> _navigationMap = {
    0: {"title": "Home", "icon": Icons.home_filled, "screen": HomeScreen()},
    1: {
      "title": "Activity",
      "icon": Icons.list_alt_outlined,
      "screen": Container(),
    },
    2: {"title": "Payment", "icon": Icons.wallet, "screen": Container()},
    3: {
      "title": "Messages",
      "icon": Icons.chat_bubble_outline,
      "screen": Container(),
    },
    4: {"title": "Account", "icon": Icons.person, "screen": Container()},
  };

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children:
              _navigationMap.values
                  .map((page) => page["screen"] as Widget)
                  .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: Color(0XFFFF6B35),
          unselectedItemColor: Color(0XFF707070),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items:
              _navigationMap.entries.map((entry) {
                return BottomNavigationBarItem(
                  icon: Icon(entry.value["icon"] as IconData),
                  label: entry.value["title"] as String,
                );
              }).toList(),
        ),
      ),
    );
  }
}
