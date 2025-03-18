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

  // Calculate subtotal with customizations
  double get _subtotal {
    return widget.cart.entries.fold(0.0, (sum, entry) {
      final MenuItemModel item = entry.key;
      final int quantity = entry.value;
      double itemPrice = item.price;

      // Add any customization costs
      if (widget.customizations != null &&
          widget.customizations!.containsKey(item) &&
          widget.customizations![item]!.containsKey('additionalPrice')) {
        itemPrice += widget.customizations![item]!['additionalPrice'];
      }

      return sum + (itemPrice * quantity);
    });
  }

  // Calculate total (including potential delivery fee)
  double get _total {
    return _subtotal; // Add delivery fee logic here if needed
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
              // Delivery/Pickup Toggle
              Row(
                children: [
                  _buildToggleButton('Delivery', true),
                  const SizedBox(width: 8),
                  _buildToggleButton('Pickup', false),
                ],
              ),

              // Delivery Address
              const SizedBox(height: 16),
              _buildSectionHeader('Delivery'),
              Card(
                child: ListTile(
                  title: const Text(
                    'Home',
                    style: TextStyle(fontFamily: 'SF Pro Display'),
                  ),
                  subtitle: const Text(
                    '00/00',
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

              // Delivery Options
              const SizedBox(height: 16),
              _buildSectionHeader('Delivery Option'),
              _buildDeliveryOptionTile('Priority', '< 45 mins', 'XX'),
              _buildDeliveryOptionTile('Standard', '45 mins', 'XX'),
              _buildDeliveryOptionTile('Saver', '55 mins', 'XX'),

              // Order Summary
              const SizedBox(height: 16),
              _buildSectionHeader('Order Summary'),
              ...widget.cart.entries
                  .map(
                    (entry) => _buildOrderSummaryItem(entry.key, entry.value),
                  )
                  .toList(),

              // Subtotal and Delivery Fee
              const Divider(),
              _buildPriceRow('Subtotal', '${_subtotal.toStringAsFixed(0)} ฿'),
              _buildPriceRow('Delivery fee', 'XX'),

              // Total
              const Divider(),
              _buildPriceTotalRow('Total', '${_total.toStringAsFixed(0)} ฿'),

              // Cutlery Option
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

              // Payment Details
              const SizedBox(height: 16),
              _buildSectionHeader('Payment Details'),
              Card(
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

              // Offers
              const SizedBox(height: 8),
              Card(
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

      // Place Order Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            HapticFeedback.mediumImpact();
            // TODO: Implement order placement
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Order placed successfully!',
                  style: TextStyle(fontFamily: 'SF Pro Display'),
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
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
    // Get customization additional price if available
    double additionalPrice = 0;
    String customizationText = '';

    if (widget.customizations != null &&
        widget.customizations!.containsKey(item)) {
      final customization = widget.customizations![item]!;

      if (customization.containsKey('additionalPrice')) {
        additionalPrice = customization['additionalPrice'];
      }

      // Build customization text
      List<String> parts = [];

      // Add meats
      if (customization.containsKey('meats') &&
          customization['meats'] != null) {
        List<String> meats = List<String>.from(customization['meats']);
        if (meats.isNotEmpty) {
          parts.add(meats.join(', '));
        }
      }

      // Add vegetables
      if (customization.containsKey('vegetables') &&
          customization['vegetables'] != null) {
        List<String> vegetables = List<String>.from(
          customization['vegetables'],
        );
        if (vegetables.isNotEmpty) {
          parts.add(vegetables.join(', '));
        }
      }

      // Add topping
      if (customization.containsKey('topping') &&
          customization['topping'] != null &&
          customization['topping'].toString().isNotEmpty) {
        parts.add(customization['topping']);
      }

      customizationText = parts.join(', ');
    }

    // Calculate item total price
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
