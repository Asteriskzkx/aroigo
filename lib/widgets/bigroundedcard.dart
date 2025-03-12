import 'package:flutter/material.dart';

class Bigroundedcard extends StatelessWidget {
  const Bigroundedcard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black26,
        //     blurRadius: 10,
        //     offset: Offset(0, 5),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Color(0XFF3D3D3D),
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Color(0XFF3D3D3D),
                  size: 24,
                ),
                onPressed: onPressed,
              ),
            ],
          ),
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              imagePath,
              width: 354,
              height: 177,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 9),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Ad ·',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              color: Color(0xFF676767),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
