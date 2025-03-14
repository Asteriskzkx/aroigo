import 'package:flutter/material.dart';

class Categorytogglebutton extends StatefulWidget {
  const Categorytogglebutton({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Categorytogglebutton();
  }
}

class _Categorytogglebutton extends State<Categorytogglebutton> {
  int? _selectedIndex;

  final List<Map<String, dynamic>> categories = [
    {'label': 'Cooked to Order', 'icon': 'assets/icons/cooking.png'},
    {'label': 'Rice Bowls', 'icon': 'assets/icons/rice.png'},
    {'label': 'Coffee & Tea', 'icon': 'assets/icons/coffee-cup.png'},
    {'label': 'Small Bites/Snacks', 'icon': 'assets/icons/snack.png'},
    {'label': 'Noodles', 'icon': 'assets/icons/noodles.png'},
    {'label': 'Fast Food', 'icon': 'assets/icons/burger.png'},
    {'label': 'Fried Chicken', 'icon': 'assets/icons/chicken.png'},
    {'label': 'Healthy', 'icon': 'assets/icons/healthy-food.png'},
    {'label': 'Spicy Salad', 'icon': 'assets/icons/animals.png'},
    {'label': 'Juice', 'icon': 'assets/icons/watermelon-juice.png'},
    {'label': 'Bakery', 'icon': 'assets/icons/pastry.png'},
    {'label': 'Bubble Tea', 'icon': 'assets/icons/bubble-tea.png'},
    {'label': 'Yakiniku', 'icon': 'assets/icons/yakiniku.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            categories.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> category = entry.value;
              return _buildToggleButton(
                index,
                category['label'],
                category['icon'],
              );
            }).toList(),
      ),
    );
  }

  Widget _buildToggleButton(int index, String label, String iconPath) {
    bool isSelected = _selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  _selectedIndex = null;
                } else {
                  _selectedIndex = index;
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.orange : Colors.transparent,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset(iconPath, width: 56, height: 56),
              ),
            ),
          ),
          SizedBox(height: 3),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 58),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.normal,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
