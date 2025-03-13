import 'package:flutter/material.dart';

class Promotionscard extends StatelessWidget {
  const Promotionscard({
    super.key,
    required this.imagePath,
    required this.promotionName,
  });

  final String imagePath;
  final String promotionName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              imagePath,
              width: 151,
              height: 272,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: 50,
            width: 151,
            decoration: BoxDecoration(
              color: Color(0xFFFFA686),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            child: Center(
              child: Text(
                promotionName,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
