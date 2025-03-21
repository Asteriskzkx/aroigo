import 'package:aroigo/screens/order_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/menu_model.dart';
import '../model/restaurant_model.dart';

class CheckoutScreen extends StatefulWidget {
  final RestaurantModel restaurant;
  final Map<MenuItemModel, int> cart;
  final Map<MenuItemModel, Map<String, dynamic>>? customizations;

  const CheckoutScreen({
    super.key,
    required this.restaurant,
    required this.cart,
    this.customizations,
  });

  @override
  State<StatefulWidget> createState() {
    return _CheckoutScreenState();
  }
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _cutleryRequested = false;

  double get _subtotal {
    return widget.cart.entries.fold(0.0, (sum, entry) {
      final MenuItemModel item = entry.key;
      final int quantity = entry.value;
      double itemPrice = item.price;

      if (widget.customizations != null &&
          widget.customizations!.containsKey(item) &&
          widget.customizations![item]!.containsKey('additionalPrice')) {
        itemPrice += widget.customizations![item]!['additionalPrice'];
      }

      return sum + (itemPrice * quantity);
    });
  }

  double get _total {
    return _subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6B35),
        title: Text(
          widget.restaurant.name,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildToggleButton('Delivery', true),
                  const SizedBox(width: 8),
                  _buildToggleButton('Pickup', false),
                ],
              ),

              const SizedBox(height: 16),
              _buildSectionHeader('Delivery'),
              Card(
                color: Colors.white,
                child: ListTile(
                  title: const Text(
                    'Home',
                    style: TextStyle(fontFamily: 'SF Pro Display'),
                  ),
                  subtitle: const Text(
                    '00/00 Ban Uea Athorn Rangsit-Khlong 90/80',
                    style: TextStyle(fontFamily: 'SF Pro Display'),
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      // TODO: Implement address editing
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(fontFamily: 'SF Pro Display'),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              _buildSectionHeader('Delivery Option'),
              _buildDeliveryOptionTile(
                'Priority',
                '< ${widget.restaurant.deliveryTime} mins',
                'XX',
              ),
              _buildDeliveryOptionTile(
                'Standard',
                '${widget.restaurant.deliveryTime} mins',
                'XX',
              ),
              _buildDeliveryOptionTile(
                'Saver',
                '${widget.restaurant.deliveryTime + 10} mins',
                'XX',
              ),

              const SizedBox(height: 16),
              _buildSectionHeader('Order Summary'),
              ...widget.cart.entries.map(
                (entry) => _buildOrderSummaryItem(entry.key, entry.value),
              ),

              const Divider(),
              _buildPriceRow('Subtotal', '${_subtotal.toStringAsFixed(0)} ฿'),
              _buildPriceRow('Delivery fee', 'XX'),

              const Divider(),
              _buildPriceTotalRow('Total', '${_total.toStringAsFixed(0)} ฿'),

              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text(
                  'Cutlery',
                  style: TextStyle(fontFamily: 'SF Pro Display'),
                ),
                subtitle: const Text(
                  'Request for cutlery only if you need.',
                  style: TextStyle(fontFamily: 'SF Pro Display'),
                ),
                value: _cutleryRequested,
                onChanged: (bool value) {
                  setState(() {
                    _cutleryRequested = value;
                  });
                },
              ),

              const SizedBox(height: 16),
              _buildSectionHeader('Payment Details'),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: const Icon(Icons.money, color: Colors.green),
                  title: const Text(
                    'B83.00',
                    style: TextStyle(fontFamily: 'SF Pro Display'),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Implement payment method selection
                  },
                ),
              ),

              const SizedBox(height: 8),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: const Icon(Icons.local_offer, color: Colors.red),
                  title: const Text(
                    'Use Offers',
                    style: TextStyle(fontFamily: 'SF Pro Display'),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Implement offers
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            HapticFeedback.mediumImpact();

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Order placed successfully!',
                  style: TextStyle(fontFamily: 'SF Pro Display'),
                ),
                backgroundColor: Color(0xFFFF6B35),
              ),
            );

            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder:
                    (
                      context,
                      animation,
                      secondaryAnimation,
                    ) => OrderConfirmationScreen(
                      restaurant: widget.restaurant,
                      totalAmount: _total,
                      orderId:
                          'GF-${DateTime.now().millisecondsSinceEpoch.toString().substring(7, 10)}',
                      deliveryAddress:
                          '00/00 Ban Uea Athorn Rangsit-Khlong 90/80',
                    ),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFF6B35),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text(
            'Place Order',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF Pro Display',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isActive) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          // TODO: Implement toggle functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isActive ? const Color(0xFFFF6B35) : Colors.grey[300],
          foregroundColor: isActive ? Colors.white : Colors.black,
        ),
        child: Text(text, style: TextStyle(fontFamily: 'SF Pro Display')),
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'SF Pro Display',
      ),
    );
  }

  Widget _buildDeliveryOptionTile(String title, String subtitle, String price) {
    return ListTile(
      title: Text(title, style: TextStyle(fontFamily: 'SF Pro Display')),
      subtitle: Text(subtitle, style: TextStyle(fontFamily: 'SF Pro Display')),
      trailing: Text(price, style: TextStyle(fontFamily: 'SF Pro Display')),
    );
  }

  Widget _buildOrderSummaryItem(MenuItemModel item, int quantity) {
    double additionalPrice = 0;
    String customizationText = '';

    if (widget.customizations != null &&
        widget.customizations!.containsKey(item)) {
      final customization = widget.customizations![item]!;

      if (customization.containsKey('additionalPrice')) {
        additionalPrice = customization['additionalPrice'];
      }

      List<String> parts = [];

      if (customization.containsKey('meats') &&
          customization['meats'] != null) {
        List<String> meats = List<String>.from(customization['meats']);
        if (meats.isNotEmpty) {
          parts.add(meats.join(', '));
        }
      }

      if (customization.containsKey('vegetables') &&
          customization['vegetables'] != null) {
        List<String> vegetables = List<String>.from(
          customization['vegetables'],
        );
        if (vegetables.isNotEmpty) {
          parts.add(vegetables.join(', '));
        }
      }

      if (customization.containsKey('topping') &&
          customization['topping'] != null &&
          customization['topping'].toString().isNotEmpty) {
        parts.add(customization['topping']);
      }

      customizationText = parts.join(', ');
    }

    double itemTotal = (item.price + additionalPrice) * quantity;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            '$quantity x ${item.name}',
            style: TextStyle(fontFamily: 'SF Pro Display'),
          ),
          trailing: Text(
            '${itemTotal.toStringAsFixed(0)} ฿',
            style: TextStyle(fontFamily: 'SF Pro Display'),
          ),
          contentPadding: EdgeInsets.zero,
        ),
        if (customizationText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              customizationText,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontFamily: 'SF Pro Display',
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPriceRow(String label, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontFamily: 'SF Pro Display')),
          Text(price, style: TextStyle(fontFamily: 'SF Pro Display')),
        ],
      ),
    );
  }

  Widget _buildPriceTotalRow(String label, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'SF Pro Display',
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFFFF6B35),
              fontFamily: 'SF Pro Display',
            ),
          ),
        ],
      ),
    );
  }
}
