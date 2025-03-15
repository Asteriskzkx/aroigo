import 'package:aroigo/screens/foodscreen_new.dart';
import 'package:aroigo/widgets/bigroundedcard.dart';
import 'package:aroigo/widgets/foodforyoucard.dart';
import 'package:aroigo/widgets/menuitem.dart';
import 'package:aroigo/widgets/promotionscard.dart';
import 'package:aroigo/widgets/restaurantscard.dart';
import 'package:aroigo/widgets/roundedcard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 92,
                color: Color(0xFFFF6B35),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/icons/scanner.png',
                              width: 24,
                              height: 24,
                              color: Color(0xFF3D3D3D),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: Color(0xFF3D3D3D)),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'SF Pro Display',
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Search Food',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xFFA3A3A3),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22, top: 9),
                    child: Menuitem(
                      title: 'Food',
                      icon: Image.asset(
                        'assets/icons/burger.png',
                        width: 50,
                        height: 50,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FoodscreenNew(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9, left: 30),
                    child: Menuitem(
                      title: 'Groceries',
                      icon: Image.asset(
                        'assets/icons/grocery-cart.png',
                        width: 50,
                        height: 50,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FoodscreenNew(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9, left: 30),
                    child: Menuitem(
                      title: 'Healthy',
                      icon: Image.asset(
                        'assets/icons/salad.png',
                        width: 50,
                        height: 50,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FoodscreenNew(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 9, right: 22),
                    child: Menuitem(
                      title: 'All',
                      icon: Image.asset(
                        'assets/icons/menu.png',
                        width: 50,
                        height: 50,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FoodscreenNew(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Roundedcard(
                        title: 'Payment',
                        icon: Image.asset(
                          'assets/icons/credit-cards.png',
                          height: 30,
                        ),
                        description: 'Add a Card',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Roundedcard(
                        title: 'Special Offers',
                        icon: Image.asset(
                          'assets/icons/promotion.png',
                          height: 30,
                        ),
                        description: 'Promotions',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Roundedcard(
                        title: 'Rewards',
                        icon: Image.asset(
                          'assets/icons/reward.png',
                          height: 30,
                        ),
                        description: '100,000',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 23),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Bigroundedcard(
                        title: 'Order Now!',
                        subtitle: 'Delicious and refreshing',
                        imagePath: 'assets/images/soda.jpeg',
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Bigroundedcard(
                        title: 'See more',
                        subtitle: 'Not a Airpods',
                        imagePath: 'assets/images/wf-1000xm5.jpg',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Restaurants you may like',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Color(0XFF3D3D3D),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/icons/knife.png',
                        restaurantName:
                            "Made to order, Auntie Bua's Kitchen - Pruksa B Village",
                        distance: 9.2,
                        rating: 4.4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/icons/cooked-chicken.png',
                        restaurantName: 'KFC - Big C Rangsit Klong 6',
                        distance: 8.7,
                        rating: 4.6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/icons/coffee.png',
                        restaurantName: 'Thai coffee - Khlong Luang 10',
                        distance: 4.6,
                        rating: 4.6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/images/kitchen.png',
                        restaurantName: 'Siam Spice',
                        distance: 3.2,
                        rating: 4.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/images/kitchen.png',
                        restaurantName: 'Bangkok Bites',
                        distance: 2.5,
                        rating: 4.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/images/kitchen.png',
                        restaurantName: 'Golden Lemongrass',
                        distance: 4.8,
                        rating: 5.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/images/kitchen.png',
                        restaurantName: 'Thai Orchid Kitchen',
                        distance: 5.5,
                        rating: 4.2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/images/kitchen.png',
                        restaurantName: 'Street Wok Thai',
                        distance: 1.8,
                        rating: 4.1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/images/kitchen.png',
                        restaurantName: 'Chili Basil Express',
                        distance: 2.9,
                        rating: 3.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/images/kitchen.png',
                        restaurantName: 'River Kwai Flavors',
                        distance: 6.3,
                        rating: 4.6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/images/kitchen.png',
                        restaurantName: 'Coconut Curry House',
                        distance: 3.7,
                        rating: 4.3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Restaurantscard(
                        imagePath: 'assets/images/kitchen.png',
                        restaurantName: 'Jasmine Rice Thai',
                        distance: 4.5,
                        rating: 3.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Restaurantscard(
                        imagePath: 'assets/images/kitchen.png',
                        restaurantName: 'The Spicy Elephant',
                        distance: 2.2,
                        rating: 4.4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Food for you',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Color(0XFF3D3D3D),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      child: Foodforyoucard(
                        imagePath: 'assets/icons/bubble-tea.png',
                        restaurantName: 'HOP Chafe',
                        productName: 'Taiwanese milk tea',
                        cost: 29,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Foodforyoucard(
                        imagePath: 'assets/icons/bubble-tea (1).png',
                        restaurantName: 'HOP Chafe',
                        productName: 'Green tea',
                        cost: 29,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Foodforyoucard(
                        imagePath: 'assets/icons/bubble-tea.png',
                        restaurantName: 'Cafe Amazon',
                        productName: 'Green tea milk shake',
                        cost: 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Foodforyoucard(
                        imagePath: 'assets/icons/bubble-tea (1).png',
                        restaurantName: 'Cafe Amazon',
                        productName: 'Iced green tea milk',
                        cost: 60,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover things you’d love',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: double.infinity),
                      child: Text(
                        'Ad ·',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF676767),
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 20),
                      child: Promotionscard(
                        imagePath: 'assets/icons/promotion (1).png',
                        promotionName: 'Promotion 1',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Promotionscard(
                        imagePath: 'assets/icons/coupon.png',
                        promotionName: 'Promotion 2',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Promotionscard(
                        imagePath: 'assets/icons/coupons.png',
                        promotionName: 'Promotion 3',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34),
            ],
          ),
        ),
      ),
    );
  }
}
