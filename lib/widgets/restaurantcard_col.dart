import 'package:flutter/material.dart';

class RestaurantcardCol extends StatefulWidget {
  const RestaurantcardCol({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RestaurantcardCol();
  }
}

class _RestaurantcardCol extends State<RestaurantcardCol> {
  final List<Map<String, dynamic>> restaurant = [
    {
      'restaurantName': 'Ruen Kruang Kaeng',
      'rating': 4.6,
      'deliveryTime': 30,
      'distance': 3.3,
      'imagePath': 'assets/images/pizzeria.png',
    },
    {
      'restaurantName': 'Cha Yen Rim Klong',
      'rating': 4.2,
      'deliveryTime': 15,
      'distance': 2.0,
      'imagePath': 'assets/images/coffee-shop (1).png',
    },
    {
      'restaurantName': 'Ruen Isaan Modern',
      'rating': 4.7,
      'deliveryTime': 35,
      'distance': 3.4,
      'imagePath': 'assets/images/restaurant (6).png',
    },
    {
      'restaurantName': 'Ba Mee Hang Rim Klong',
      'rating': 4.5,
      'deliveryTime': 20,
      'distance': 2.4,
      'imagePath': 'assets/images/restaurant (5).png',
    },
    {
      'restaurantName': 'Khanom Krok Baan Suan',
      'rating': 4.6,
      'deliveryTime': 25,
      'distance': 2.8,
      'imagePath': 'assets/images/restaurant (4).png',
    },
    {
      'restaurantName': 'Ruen Khao Mok Halal',
      'rating': 4.7,
      'deliveryTime': 30,
      'distance': 3.6,
      'imagePath': 'assets/images/restaurant (3).png',
    },
    {
      'restaurantName': 'Moo Ping Rim Thang',
      'rating': 4.5,
      'deliveryTime': 15,
      'distance': 2.6,
      'imagePath': 'assets/images/restaurant (2).png',
    },
    {
      'restaurantName': 'Burger Isaan Fusion',
      'rating': 4.4,
      'deliveryTime': 25,
      'distance': 3.0,
      'imagePath': 'assets/images/burger-bar.png',
    },
    {
      'restaurantName': 'Jae Delivery Rim Klong',
      'rating': 4.6,
      'deliveryTime': 20,
      'distance': 2.8,
      'imagePath': 'assets/images/restaurant (1).png',
    },
    {
      'restaurantName': 'Cafe Ya Dong Rim Klong',
      'rating': 4.3,
      'deliveryTime': 20,
      'distance': 2.9,
      'imagePath': 'assets/images/coffee-shop.png',
    },
    {
      'restaurantName': 'Ruen Khanom Jeen Nam Ya',
      'rating': 4.6,
      'deliveryTime': 25,
      'distance': 3.2,
      'imagePath': 'assets/images/restaurant.png',
    },
    {
      'restaurantName': 'Kai Yang Burger',
      'rating': 4.2,
      'deliveryTime': 15,
      'distance': 2.7,
      'imagePath': 'assets/images/fast-food.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          restaurant.map((restaurantData) {
            return _buildRestaurantCard(
              restaurantData['restaurantName'],
              restaurantData['rating'],
              restaurantData['deliveryTime'],
              restaurantData['distance'],
              restaurantData['imagePath'],
            );
          }).toList(),
    );
  }

  Widget _buildRestaurantCard(
    String restaurantName,
    double rating,
    int deliveryTime,
    double distance,
    String imagePath,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              imagePath,
              width: 117,
              height: 117,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 249.0),
                child: Text(
                  restaurantName,
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
                    rating.toString(),
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
                    '$deliveryTime mins',
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
                    '$distance km',
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
    );
  }
}
