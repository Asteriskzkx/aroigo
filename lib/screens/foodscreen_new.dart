import 'package:aroigo/widgets/bigroundedcard.dart';
import 'package:aroigo/widgets/categorytogglebutton.dart';
import 'package:aroigo/widgets/coffee_and_tea_shop_col.dart';
import 'package:aroigo/widgets/cooked_to_order_restaurantcard_col.dart';
import 'package:aroigo/widgets/fast_food_restaurant_col.dart';
import 'package:aroigo/widgets/filtersorting.dart';
import 'package:aroigo/widgets/fried_chicken_restaurant_col.dart';
import 'package:aroigo/widgets/noodle_restaurant_col.dart';
import 'package:aroigo/widgets/promorestaurantcard.dart';
import 'package:aroigo/widgets/restaurantcard_col.dart';
import 'package:aroigo/widgets/rice_bowls_restaurantcard_col.dart';
import 'package:aroigo/widgets/small_bites_snacks_shop_col.dart';
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

  // Track whether we're mounted to prevent setState after dispose
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    _searchController.addListener(_onSearchChanged);

    // Set _selectedCategoryIndex to null to show default page
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

  // Method to show specific category page
  void _showCategoryPage(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        index + 1, // +1 because default page is at index 0
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Method to show default page
  void _showDefaultPage() {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        0, // Default page is at index 0
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Handle page changes from navigation
  void _onPageChanged(int page) {
    if (!_isMounted) return;

    setState(() {
      if (page == 0) {
        // Default page
        _selectedCategoryIndex = null;
      } else {
        // Category page (adjusting for the default page offset)
        _selectedCategoryIndex = page - 1;
      }
    });
  }

  // Build the default content when no category is selected
  Widget _buildDefaultContent() {
    return SingleChildScrollView(
      key: ValueKey('default_page'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Featured promotions section
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //   child: Text(
          //     'Featured Promotions',
          //     style: TextStyle(
          //       fontFamily: 'SF Pro Display',
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 8),

          // Horizontal scrolling promotions
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
          // Deals section
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
          // Popular restaurants section
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

  // Build different content for each category tab with error handling
  Widget _buildCategoryContent(int categoryIndex) {
    try {
      // Get the category name
      String categoryName = "Category";
      try {
        if (_categoryToggle.categoryList.length > categoryIndex) {
          categoryName = _categoryToggle.categoryList[categoryIndex]['label'];
        }
      } catch (e) {
        // Fallback to using static category list if available
        final List<Map<String, dynamic>> fallbackCategories = [
          {'label': 'Cooked to Order', 'icon': 'assets/icons/cooking.png'},
          {'label': 'Rice Bowls', 'icon': 'assets/icons/rice.png'},
          {'label': 'Coffee & Tea', 'icon': 'assets/icons/coffee-cup.png'},
          // Add more if needed
        ];

        if (fallbackCategories.length > categoryIndex) {
          categoryName = fallbackCategories[categoryIndex]['label'];
        }
      }

      // Create a simpler widget structure based on category
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
              FilterSorting(),
              const SizedBox(height: 16),
              _buildSafeWidget(() => CoffeeAndTeaShopCol()),
            ],
          );
          break;

        case 3: // Small Bites/Snacks
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryHeader('$categoryName Shops'),
              FilterSorting(),
              const SizedBox(height: 16),
              _buildSafeWidget(() => SmallBitesSnacksShopCol()),
            ],
          );
          break;

        case 4: // Noodles
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryHeader('$categoryName Shops'),
              FilterSorting(),
              const SizedBox(height: 16),
              _buildSafeWidget(() => NoodleRestaurantCol()),
            ],
          );
          break;

        case 5: // Fast Food
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryHeader('$categoryName Shops'),
              FilterSorting(),
              const SizedBox(height: 16),
              _buildSafeWidget(() => FastFoodRestaurantCol()),
            ],
          );
          break;

        case 6: // Fried Chicken
          content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryHeader('$categoryName Shops'),
              FilterSorting(),
              const SizedBox(height: 16),
              _buildSafeWidget(() => FriedChickenRestaurantCol()),
            ],
          );
          break;

        default:
          // Simplified default template
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

      // Wrap content in a scroll view with key for better performance
      return SingleChildScrollView(
        key: ValueKey('category_$categoryIndex'),
        child: content,
      );
    } catch (e) {
      // Return a fallback widget if anything goes wrong
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

  // Safe widget builder to prevent crashes
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

  // Helper method for category headers
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
        physics: const NeverScrollableScrollPhysics(), // Prevent main scroll
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

          // The rest of your sliver content
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                // Toggle buttons and category buttons
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

                // Instead of conditionally showing either default content or PageView,
                // we now use a PageView with default content as the first page
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(), // Disable swiping
                    onPageChanged: _onPageChanged,
                    children: [
                      // First page is always the default page
                      _buildDefaultContent(),
                      // Then add all category pages
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
}
