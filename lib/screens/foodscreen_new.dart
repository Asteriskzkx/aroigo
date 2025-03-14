import 'package:aroigo/widgets/bigroundedcard.dart';
import 'package:aroigo/widgets/categorytogglebutton.dart';
import 'package:aroigo/widgets/promorestaurantcard.dart';
import 'package:aroigo/widgets/restaurantcard_col.dart';
import 'package:aroigo/widgets/togglebutton.dart';
import 'package:flutter/material.dart';

class FoodscreenNew extends StatefulWidget {
  const FoodscreenNew({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FoodscreenNew();
  }
}

class _FoodscreenNew extends State<FoodscreenNew> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchText = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 124.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0XFFFF6B35), const Color(0XFFFF8C5A)],
                    stops: const [0.3, 0.7],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              const Text(
                                "DELIVER TO",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "Home",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search Food',
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'SF Pro Display',
                              color: Color(0xFFA3A3A3),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 16.0,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'SF Pro Display',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              titlePadding: EdgeInsets.zero,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Togglebutton(),
                      ),
                      const SizedBox(height: 6),
                      Categorytogglebutton(),
                      const SizedBox(height: 13),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              child: Bigroundedcard(
                                title: 'Hot Deals 22 - 31 March',
                                subtitle: 'Apply ‘MEGA’ get up to',
                                imagePath:
                                    'assets/images/Pad-Kra-Pao-Thai-Basil-Minced-Pork.jpg',
                                onPressed: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Bigroundedcard(
                                title: 'Best Value Deals!',
                                subtitle: 'Apply ‘MEGA’ get up to',
                                imagePath: 'assets/images/Khao khluk kapi.jpg',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 13),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'PROMO Resturants',
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
                      Promorestaurantcard(),
                      const SizedBox(height: 13),
                      RestaurantcardCol(),
                      const SizedBox(height: 75),
                    ],
                  );
                }
                // final itemText = 'Item ${index - 1}';
                // if (_searchText.isEmpty ||
                //     itemText.toLowerCase().contains(
                //       _searchText.toLowerCase(),
                //     )) {
                //   return ListTile(title: Text(itemText));
                // } else {
                //   return const SizedBox.shrink();
                // }
              },
              // childCount:
              //     101,
            ),
          ),
        ],
      ),
    );
  }
}
