import 'package:flutter/material.dart';

class Promorestaurantcard extends StatefulWidget {
  const Promorestaurantcard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Promorestaurantcard();
  }
}

class _Promorestaurantcard extends State<Promorestaurantcard> {
  final List<Map<String, dynamic>> promoRestaurant = [
    {
      'restaurantName': 'Burger Sabai',
      'deliveryTime': 20,
      'distance': 2.8,
      'imagePath': 'assets/images/fast-food.png',
    },
    {
      'restaurantName': 'Ruen Rim Thanon',
      'deliveryTime': 30,
      'distance': 3.8,
      'imagePath': 'assets/images/restaurant.png',
    },
    {
      'restaurantName': 'Cafe Baan Suan',
      'deliveryTime': 25,
      'distance': 3.0,
      'imagePath': 'assets/images/coffee-shop.png',
    },
    {
      'restaurantName': 'Kin Dee Delivery',
      'deliveryTime': 15,
      'distance': 2.0,
      'imagePath': 'assets/images/restaurant (1).png',
    },
    {
      'restaurantName': 'Rod Ded Rim Thang',
      'deliveryTime': 25,
      'distance': 2.8,
      'imagePath': 'assets/images/restaurant (2).png',
    },
    {
      'restaurantName': 'Ruen Halal Thai',
      'deliveryTime': 30,
      'distance': 3.5,
      'imagePath': 'assets/images/restaurant (3).png',
    },
    {
      'restaurantName': 'Baan Kanom Thai',
      'deliveryTime': 20,
      'distance': 2.6,
      'imagePath': 'assets/images/restaurant (4).png',
    },
    {
      'restaurantName': 'Kuay Tiew Rim Klong',
      'deliveryTime': 18,
      'distance': 2.3,
      'imagePath': 'assets/images/restaurant (5).png',
    },
    {
      'restaurantName': 'Ruen Thai Modern',
      'deliveryTime': 30,
      'distance': 3.2,
      'imagePath': 'assets/images/restaurant (6).png',
    },
    {
      'restaurantName': 'Cafe Rim Nam',
      'deliveryTime': 20,
      'distance': 2.9,
      'imagePath': 'assets/images/coffee-shop (1).png',
    },
    {
      'restaurantName': 'Ruen Suan Som',
      'deliveryTime': 25,
      'distance': 3.1,
      'imagePath': 'assets/images/pizzeria.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            promoRestaurant.map((restaurant) {
              return _buildRestaurantCard(
                restaurant['restaurantName'],
                restaurant['deliveryTime'],
                restaurant['distance'],
                restaurant['imagePath'],
              );
            }).toList(),
      ),
    );
  }

  Widget _buildRestaurantCard(
    String restaurantName,
    int deliveryTime,
    double distance,
    String imagePath,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              imagePath,
              width: 147,
              height: 147,
              fit: BoxFit.cover,
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
              restaurantName,
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
                '$deliveryTime min',
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
                '$distance km',
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
    );
  }
}
