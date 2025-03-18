import 'package:aroigo/data/customizationrepository.dart';
import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';
import 'package:aroigo/screens/checkoutscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dynamic_menu_customization_screen.dart';

class RestaurantScreen extends StatefulWidget {
  final RestaurantModel restaurant;

  const RestaurantScreen({Key? key, required this.restaurant})
    : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final Map<MenuItemModel, Map<String, dynamic>> _cart = {};

  int get _totalItems {
    return _cart.length;
  }

  double get _totalCost {
    return _cart.entries.fold(0.0, (sum, entry) {
      double itemPrice = entry.key.price;

      double additionalPrice = 0;
      if (entry.value.containsKey('additionalPrice')) {
        additionalPrice = entry.value['additionalPrice'];
      }

      return sum + itemPrice + additionalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: const Color(0xFFFF6B35),
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                color: Color(0xFFFF6B35),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Text(
                  widget.restaurant.name,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'SF Pro Display',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              background: Image.asset(
                widget.restaurant.imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Color(0xFFFF6B35),
                    child: const Center(
                      child: Icon(Icons.restaurant, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  HapticFeedback.lightImpact();
                },
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0XFFFFCB45),
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.restaurant.rating.toString(),
                            style: const TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          const Icon(
                            Icons.delivery_dining,
                            color: Color(0XFFFF6B35),
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${widget.restaurant.deliveryTime} mins | ${widget.restaurant.distance} km',
                            style: const TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 14,
                              color: Color(0xFF3D3D3D),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                final menuItem = widget.restaurant.menu[index];
                return _buildMenuItem(menuItem);
              }, childCount: widget.restaurant.menu.length),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),

      floatingActionButton:
          _totalItems > 0
              ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => _buildCartBottomSheet(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.shopping_basket,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Basket • $_totalItems Item',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF Pro Display',
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '฿${_totalCost.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ],
                  ),
                ),
              )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildMenuItem(MenuItemModel item) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        _showItemDetailsBottomSheet(item);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                item.image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    height: 150,
                    child: const Center(
                      child: Icon(Icons.fastfood, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${item.price} ฿',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFFFF6B35),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          _openCustomizationScreen(item);
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: const Color(0XFFFF6B35),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartBottomSheet() {
    return Container(
      // color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Your Basket',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF Pro Display',
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child:
                _cart.isEmpty
                    ? const Center(
                      child: Text(
                        'Your basket is empty',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    )
                    : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...(_cart.entries.map((entry) {
                            final item = entry.key;
                            final customizations = entry.value;

                            double itemTotal = item.price;
                            if (customizations.containsKey('additionalPrice')) {
                              itemTotal += customizations['additionalPrice'];
                            }

                            String customizationText = '';
                            if (customizations.containsKey('meats') &&
                                customizations['meats'] != null) {
                              List<String> meats = List<String>.from(
                                customizations['meats'],
                              );
                              if (meats.isNotEmpty) {
                                customizationText += meats.join(', ');
                              }
                            }
                            if (customizations.containsKey('vegetables') &&
                                customizations['vegetables'] != null) {
                              List<String> vegetables = List<String>.from(
                                customizations['vegetables'],
                              );
                              if (vegetables.isNotEmpty) {
                                customizationText +=
                                    customizationText.isEmpty
                                        ? vegetables.join(', ')
                                        : ', ' + vegetables.join(', ');
                              }
                            }
                            if (customizations.containsKey('topping') &&
                                customizations['topping'] != null) {
                              customizationText +=
                                  customizationText.isEmpty
                                      ? '${customizations['topping']}'
                                      : ', ${customizations['topping']}';
                            }

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Dismissible(
                                key: Key(item.id + DateTime.now().toString()),
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  setState(() {
                                    _cart.remove(item);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${item.name} removed from cart',
                                      ),
                                      duration: const Duration(seconds: 2),
                                      action: SnackBarAction(
                                        label: 'UNDO',
                                        onPressed: () {
                                          setState(() {
                                            _cart[item] = customizations;
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'SF Pro Display',
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          '${itemTotal.toStringAsFixed(0)} ฿',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'SF Pro Display',
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (customizationText.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 4.0,
                                        ),
                                        child: Text(
                                          customizationText,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontFamily: 'SF Pro Display',
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    if (customizations.containsKey('note') &&
                                        customizations['note'] != null &&
                                        customizations['note']
                                            .toString()
                                            .isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 4.0,
                                        ),
                                        child: Text(
                                          'Note: ${customizations['note']}',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 14,
                                            fontFamily: 'SF Pro Display',
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }).toList()),
                        ],
                      ),
                    ),
          ),

          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                ),
              ),
              Text(
                '฿${_totalCost.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFFFF6B35),
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed:
                _cart.isEmpty
                    ? null
                    : () {
                      Navigator.pop(context);

                      final Map<MenuItemModel, int> simplifiedCart = {};
                      _cart.forEach((item, customizations) {
                        simplifiedCart[item] = 1;
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => CheckoutScreen(
                                restaurant: widget.restaurant,
                                cart: simplifiedCart,
                                customizations: _cart,
                              ),
                        ),
                      );
                    },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFFFF6B35),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Checkout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Display',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showItemDetailsBottomSheet(MenuItemModel item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            expand: false,
            builder:
                (context, scrollController) => ListView(
                  controller: scrollController,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.asset(
                        item.image,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.description,
                            style: const TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${item.price} ฿',
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFFF6B35),
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  HapticFeedback.mediumImpact();
                                  Navigator.pop(context);
                                  _openCustomizationScreen(item);
                                },
                                icon: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0XFFFF6B35),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          ),
    );
  }

  void _openCustomizationScreen(MenuItemModel item) {
    final customizationOptions =
        CustomizationRepository.getCustomizationOptions(item.id);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => DynamicMenuCustomizationScreen(
              menuItem: item,
              customizationOptions: customizationOptions,
              onAddToCart: (menuItem, customizations) {
                setState(() {
                  _cart[menuItem] = customizations;
                });
              },
            ),
      ),
    );
  }

  String buildCustomizationSummary(Map<String, dynamic> customizations) {
    List<String> parts = [];

    customizations.forEach((key, value) {
      if (key == 'additionalPrice' || key == 'totalPrice' || key == 'note') {
        return;
      }

      if (value is List && value.isNotEmpty) {
        String category = key.replaceAll('_', ' ');
        category = category[0].toUpperCase() + category.substring(1);

        parts.add('$category: ${value.join(', ')}');
      }
    });

    return parts.join(' | ');
  }
}
