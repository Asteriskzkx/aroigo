import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RestaurantScreen extends StatefulWidget {
  final RestaurantModel restaurant;

  const RestaurantScreen({Key? key, required this.restaurant})
    : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // App Bar with Restaurant Image
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.restaurant.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Image.asset(
                widget.restaurant.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
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
                  // TODO: Implement favorite functionality
                },
              ),
            ],
          ),

          // Restaurant Details Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Restaurant Info Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Rating
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

                      // Delivery and Distance Info
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

                  // Menu Section Title
                  const Text(
                    'Today\'s Offer',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Menu Items Grid
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

          // Bottom padding
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),

      // Floating Action Button for Cart
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          HapticFeedback.mediumImpact();
          // TODO: Implement cart functionality
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cart feature coming soon!')),
          );
        },
        backgroundColor: const Color(0XFFFF6B35),
        icon: const Icon(Icons.shopping_cart, color: Colors.white),
        label: const Text(
          'View Cart',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
            // Menu Item Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.asset(
                item.image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
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

            // Menu Item Details
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
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
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
                          _addToCart(item);
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
                    // Item Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.asset(
                        item.image,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Item Details
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
                                  _addToCart(item);
                                  Navigator.pop(context);
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

  void _addToCart(MenuItemModel item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} added to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
