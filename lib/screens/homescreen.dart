import 'package:aroigo/widgets/bigroundedcard.dart';
import 'package:aroigo/widgets/menuitem.dart';
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
      // appBar: AppBar(title: Text('Home Screen')),
      body: Expanded(
        child: SingleChildScrollView(
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
                      onTap: () {},
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
                      onTap: () {},
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
                      onTap: () {},
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
                      onTap: () {},
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
                    Bigroundedcard(
                      title: 'Order Now!',
                      subtitle: 'Delicious and refreshing',
                      imagePath: 'assets/images/soda.jpeg',
                      onPressed: () {},
                    ),
                    Bigroundedcard(
                      title: 'See more',
                      subtitle: 'Not a Airpods',
                      imagePath: 'assets/images/wf-1000xm5.jpg',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
