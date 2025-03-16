import 'package:aroigo/widgets/bigroundedcard.dart';
import 'package:aroigo/widgets/categorytogglebutton.dart';
import 'package:aroigo/widgets/cooked_to_order_restaurantcard_col.dart';
import 'package:aroigo/widgets/filtersorting.dart';
import 'package:aroigo/widgets/promorestaurantcard.dart';
import 'package:aroigo/widgets/restaurantcard_col.dart';
import 'package:aroigo/widgets/rice_bowls_restaurantcard_col.dart';
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
  int? _selectedCategoryIndex;
  final PageController _pageController = PageController();
  final Categorytogglebutton _categoryToggle = Categorytogglebutton();

  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    _searchController.addListener(_onSearchChanged);

    _selectedCategoryIndex = null;
  }

  @override
  void dispose() {
    _isMounted = false;
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_isMounted) {
      setState(() {
        _searchText = _searchController.text;
      });
    }
  }

  void _onCategorySelected(int? index) {
    if (!_isMounted) return;

    setState(() {
      _selectedCategoryIndex = index;
    });

    if (index == null) {
      _showDefaultPage();
    } else {
      _showCategoryPage(index);
    }
  }

  void _showCategoryPage(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showDefaultPage() {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        0,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPageChanged(int page) {
    if (!_isMounted) return;

    setState(() {
      if (page == 0) {
        _selectedCategoryIndex = null;
      } else {
        _selectedCategoryIndex = page - 1;
      }
    });
  }

  Widget _buildDefaultContent() {
    return SingleChildScrollView(
      key: ValueKey('default_page'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: _buildSafeWidget(
                    () => Bigroundedcard(
                      title: 'Special Deals',
                      subtitle: 'Limited time offers',
                      imagePath:
                          'assets/images/Pad-Kra-Pao-Thai-Basil-Minced-Pork.jpg',
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: _buildSafeWidget(
                    () => Bigroundedcard(
                      title: 'New Restaurants',
                      subtitle: 'Try something different',
                      imagePath: 'assets/images/Khao khluk kapi.jpg',
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              'Today\'s Best Deals',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildSafeWidget(() => Promorestaurantcard()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              'Popular Restaurants',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildSafeWidget(() => RestaurantcardCol()),
        ],
      ),
    );
  }

  Widget _buildCategoryContent(int categoryIndex) {
    try {
      String categoryName = "Category";
      try {
        if (_categoryToggle.categoryList.length > categoryIndex) {
          categoryName = _categoryToggle.categoryList[categoryIndex]['label'];
        }
      } catch (e) {
        final List<Map<String, dynamic>> fallbackCategories = [
          {'label': 'Cooked to Order', 'icon': 'assets/icons/cooking.png'},
          {'label': 'Rice Bowls', 'icon': 'assets/icons/rice.png'},
          {'label': 'Coffee & Tea', 'icon': 'assets/icons/coffee-cup.png'},
        ];

        if (fallbackCategories.length > categoryIndex) {
          categoryName = fallbackCategories[categoryIndex]['label'];
        }
      }

      Widget content;

      switch (categoryIndex) {
        case 0: // Cooked to Order
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryHeader('$categoryName Restaurants'),
              FilterSorting(onFilterSelected: (filterType) {}),
              const SizedBox(height: 16),
              _buildSafeWidget(() => CookedToOrderRestaurantcardCol()),
            ],
          );
          break;

        case 1: // Rice Bowls
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryHeader('$categoryName Specials'),
              FilterSorting(),
              const SizedBox(height: 16),
              _buildSafeWidget(() => RiceBowlsRestaurantcardCol()),
            ],
          );
          break;

        case 2: // Coffee & Tea
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryHeader('$categoryName Shops'),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Popular Coffee Shops',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildCoffeeShopItem('Starbucks', '0.5 mi', 4.5),
                        _buildCoffeeShopItem('Coffee World', '1.2 mi', 4.7),
                        _buildCoffeeShopItem('Brew House', '0.8 mi', 4.2),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
          break;

        default:
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryHeader(categoryName),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Explore our selection of ${categoryName.toLowerCase()} options.',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
      }

      return SingleChildScrollView(
        key: ValueKey('category_$categoryIndex'),
        child: content,
      );
    } catch (e) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Unable to load category content',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      );
    }
  }

  Widget _buildSafeWidget(Widget Function() builder) {
    try {
      return builder();
    } catch (e) {
      return Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Widget unavailable',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      );
    }
  }

  Widget _buildCategoryHeader(String title) {
    return Visibility(
      visible: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 134.0,
            backgroundColor: Color(0XFFFF6B35),
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
              titlePadding: EdgeInsets.zero,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(),
            ),
          ),

          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: _buildSafeWidget(() => Togglebutton()),
                ),
                const SizedBox(height: 6),
                _buildSafeWidget(
                  () => Categorytogglebutton(
                    onCategorySelected: _onCategorySelected,
                    initialSelectedIndex: _selectedCategoryIndex,
                  ),
                ),
                const SizedBox(height: 10),

                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: _onPageChanged,
                    children: [
                      _buildDefaultContent(),

                      ...List.generate(
                        _categoryToggle.categoryList.length,
                        (index) => _buildCategoryContent(index),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeShopItem(String name, String distance, double rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.coffee, color: Colors.brown),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  distance,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18),
              const SizedBox(width: 2),
              Text(
                rating.toString(),
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
