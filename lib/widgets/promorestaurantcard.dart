import 'package:aroigo/model/restaurant_model.dart';
import 'package:aroigo/screens/restaurantscreen.dart';
import 'package:flutter/material.dart';
import '../data/promo_restaurant.dart';

class Promorestaurantcard extends StatefulWidget {
  const Promorestaurantcard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Promorestaurantcard();
  }
}

class _Promorestaurantcard extends State<Promorestaurantcard> {
  final List<RestaurantModel> promoRestaurant =
      PromoRestaurantData.getPromoRestaurants();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            promoRestaurant.map((restaurant) {
              return _buildRestaurantCard(restaurant);
            }).toList(),
      ),
    );
  }

  Widget _buildRestaurantCard(RestaurantModel restaurant) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantScreen(restaurant: restaurant),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                restaurant.imagePath,
                width: 147,
                height: 147,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 147,
                    height: 147,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.restaurant, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 9),
            Text(
              'PROMO',
              style: TextStyle(
                color: Color(0XFFFF6B35),
                fontFamily: 'SF Pro Display',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 147),
              child: Text(
                restaurant.name,
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
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.delivery_dining, color: Colors.orange, size: 16),
                const SizedBox(width: 4),
                Text(
                  '${restaurant.deliveryTime} min',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 12,
                    color: Color(0xFF676767),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.location_on, color: Colors.orange, size: 16),
                const SizedBox(width: 4),
                Text(
                  '${restaurant.distance} km',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 12,
                    color: Color(0xFF676767),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
