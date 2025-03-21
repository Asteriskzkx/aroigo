import 'package:aroigo/data/healthy_restaurant.dart';
import 'package:aroigo/model/restaurant_model.dart';
import 'package:aroigo/screens/restaurantscreen.dart';
import 'package:flutter/material.dart';

class HealthyRestaurantCol extends StatefulWidget {
  const HealthyRestaurantCol({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HealthyRestaurantCol();
  }
}

class _HealthyRestaurantCol extends State<HealthyRestaurantCol> {
  final List<RestaurantModel> restaurant = HealthyRestaurant.getRestaurants();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          restaurant.map((restaurantData) {
            return _buildRestaurantCard(restaurantData);
          }).toList(),
    );
  }

  Widget _buildRestaurantCard(RestaurantModel restaurant) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantScreen(restaurant: restaurant),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                restaurant.imagePath,
                width: 117,
                height: 117,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 117,
                    height: 117,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.restaurant, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 249.0),
                  child: Text(
                    restaurant.name,
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.star, color: Color(0XFFFFCB45), size: 20),
                    const SizedBox(width: 4),
                    Text(
                      restaurant.rating.toString(),
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                        color: Color(0xFF676767),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.delivery_dining,
                      color: Color(0XFFFF6B35),
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${restaurant.deliveryTime} mins',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                        color: Color(0xFF3D3D3D),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Color(0XFFFF6B35), size: 20),
                    const SizedBox(width: 4),
                    Text(
                      '${restaurant.distance} km',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                        color: Color(0xFF3D3D3D),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
