import 'package:flutter/material.dart';
import 'package:aroigo/model/restaurant_model.dart';
import 'package:provider/provider.dart';

class OrderTrackingProvider extends ChangeNotifier {
  bool _showOrderPopup = false;
  String _orderStatus = '';
  String _restaurantName = '';
  String _estimatedTime = '';
  String _orderId = '';
  String _deliveryAddress = '';
  double _totalAmount = 0.0;
  RestaurantModel? _restaurant;

  bool get showOrderPopup => _showOrderPopup;
  String get orderStatus => _orderStatus;
  String get restaurantName => _restaurantName;
  String get estimatedTime => _estimatedTime;
  String get orderId => _orderId;
  String get deliveryAddress => _deliveryAddress;
  double get totalAmount => _totalAmount;
  RestaurantModel? get restaurant => _restaurant;

  void startOrderTracking({
    required RestaurantModel restaurant,
    required double totalAmount,
    required String deliveryAddress,
  }) {
    _restaurant = restaurant;
    _restaurantName = restaurant.name;
    _totalAmount = totalAmount;
    _deliveryAddress = deliveryAddress;

    _orderId =
        'GF-${DateTime.now().millisecondsSinceEpoch.toString().substring(7, 10)}';

    final now = DateTime.now();
    final estimatedDelivery = now.add(
      Duration(minutes: restaurant.deliveryTime),
    );

    _estimatedTime =
        '${estimatedDelivery.hour.toString().padLeft(2, '0')}:${estimatedDelivery.minute.toString().padLeft(2, '0')}';

    _orderStatus = "Kitchen's preparing your order";

    _showOrderPopup = true;

    notifyListeners();
  }

  void updateOrderStatus(String status) {
    _orderStatus = status;
    notifyListeners();
  }

  void hideOrderPopup() {
    _showOrderPopup = false;
    notifyListeners();
  }

  void completeOrder() {
    _orderStatus = "Order delivered";
    notifyListeners();

    Future.delayed(const Duration(hours: 1), () {
      _showOrderPopup = false;
      notifyListeners();
    });
  }
}

class OrderPopupOverlay extends StatelessWidget {
  final Widget child;

  const OrderPopupOverlay({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderTrackingProvider>(
      builder: (context, orderProvider, _) {
        return Stack(
          children: [
            child,
            if (orderProvider.showOrderPopup)
              Positioned(
                bottom: 80,
                left: 16,
                right: 16,
                child: _buildOrderStatusPopup(context, orderProvider),
              ),
          ],
        );
      },
    );
  }

  Widget _buildOrderStatusPopup(
    BuildContext context,
    OrderTrackingProvider orderProvider,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Navigate to order tracking screen
            // In a full implementation, this would open the OrderConfirmationScreen
            if (orderProvider.restaurant != null) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => OrderConfirmationScreen(
              //       restaurant: orderProvider.restaurant!,
              //       totalAmount: orderProvider.totalAmount,
              //       orderId: orderProvider.orderId,
              //       deliveryAddress: orderProvider.deliveryAddress,
              //     ),
              //   ),
              // );
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/food_icon.png',
                      width: 32,
                      height: 32,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.egg_alt,
                          color: Colors.orange[700],
                          size: 24,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        orderProvider.orderStatus,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      Text(
                        orderProvider.restaurantName,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'By ${orderProvider.estimatedTime}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                    Text(
                      'Estimated arrival',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                  ],
                ),

                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    // Hide the popup
                    orderProvider.hideOrderPopup();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
