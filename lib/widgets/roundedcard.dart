import 'package:flutter/material.dart';

class Roundedcard extends StatelessWidget {
  const Roundedcard({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });
  final String title;
  final String description;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFE8E8E8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              // SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  icon,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
