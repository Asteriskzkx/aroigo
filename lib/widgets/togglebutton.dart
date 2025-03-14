import 'package:flutter/material.dart';

class Togglebutton extends StatefulWidget {
  const Togglebutton({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Togglebutton();
  }
}

class _Togglebutton extends State<Togglebutton> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildToggleButton(0, 'Delivery', Icons.delivery_dining),
        SizedBox(width: 8),
        _buildToggleButton(1, 'Pickup', Icons.shopping_bag),
        SizedBox(width: 8),
        _buildToggleButton(2, 'Dine Out Deals', Icons.restaurant),
      ],
    );
  }

  Widget _buildToggleButton(int index, String label, IconData icon) {
    bool isSelected = _selectedIndex == index;

    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      icon: Icon(icon, color: isSelected ? Colors.white : Color(0XFFFF6B35)),
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0XFFFF6B35),
          fontSize: 14,
          fontFamily: 'SF Pro Display',
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0XFFFF6B35) : Color(0XFFFFC6AC),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        // minimumSize: Size(0, 0),
      ),
    );
  }
}
