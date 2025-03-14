import 'package:flutter/material.dart';

class Restaurantscard extends StatelessWidget {
  const Restaurantscard({
    super.key,
    required this.imagePath,
    required this.restaurantName,
    required this.distance,
    required this.rating,
  });
  final String imagePath;
  final String restaurantName;
  final double distance;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 220),
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
                    restaurantName,
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  '$distance km · ★ $rating',
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
        },
      ),
    );
  }
}
