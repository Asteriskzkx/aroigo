import 'package:flutter/material.dart';

class Foodforyoucard extends StatelessWidget {
  const Foodforyoucard({
    super.key,
    required this.imagePath,
    required this.restaurantName,
    required this.productName,
    required this.cost,
  });
  final String imagePath;
  final String restaurantName;
  final String productName;
  final double cost;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: 147,
              height: 147,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 9),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 147),
            child: Text(
              productName,
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          // SizedBox(height: 7),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 147),
            child: Text(
              restaurantName,
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                color: Color(0xFF676767),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          // SizedBox(height: 7),
          Text(
            '฿$cost',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
