import 'package:flutter/material.dart';

class Menuitem extends StatelessWidget {
  const Menuitem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xFFFFB59A),
              shape: BoxShape.circle,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black26,
              //     blurRadius: 10,
              //     offset: Offset(0, 5),
              //   ),
              // ],
            ),
            child: icon,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
