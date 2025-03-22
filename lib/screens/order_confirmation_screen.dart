import 'package:aroigo/widgets/order_tracking_provider.dart';
import 'package:flutter/material.dart';
import 'package:aroigo/model/restaurant_model.dart';
import 'package:provider/provider.dart';

class OrderConfirmationScreen extends StatefulWidget {
  final RestaurantModel restaurant;
  final double totalAmount;
  final String orderId;
  final String deliveryAddress;

  const OrderConfirmationScreen({
    super.key,
    required this.restaurant,
    required this.totalAmount,
    required this.orderId,
    required this.deliveryAddress,
  });

  @override
  State<StatefulWidget> createState() {
    return _OrderConfirmationScreenState();
  }
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen>
    with SingleTickerProviderStateMixin {
  late String deliveryTime;
  late String currentStatus;
  late bool isOnTime;

  // Add animation controller and animation for progress bar
  late AnimationController _progressController;
  Animation<double>? _progressAnimation;
  final Duration _totalDeliveryTime = Duration(minutes: 1); // 1 minute total
  final List<String> _statusMessages = [
    "Kitchen's preparing your order",
    "Food is ready for pickup",
    "Driver is on the way",
    "Order delivered",
  ];

  @override
  void initState() {
    super.initState();

    // Get estimated delivery time from provider instead of hardcoding
    final orderTracker = Provider.of<OrderTrackingProvider>(
      context,
      listen: false,
    );

    // Set delivery time to match what's in the provider
    // Format it as a range (e.g., "14:30 - 14:40")
    final estimatedTime = orderTracker.estimatedTime;

    // Parse the time to create a range
    final timeParts = estimatedTime.split(':');
    if (timeParts.length == 2) {
      int hour = int.tryParse(timeParts[0]) ?? 0;
      int minute = int.tryParse(timeParts[1]) ?? 0;

      // Create DateTime for exact time
      final exactTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        hour,
        minute,
      );

      // Add 10 minutes for the range
      final rangeEndTime = exactTime.add(const Duration(minutes: 1));

      // Format as "HH:MM - HH:MM"
      deliveryTime =
          "${estimatedTime} - ${rangeEndTime.hour.toString().padLeft(2, '0')}:${rangeEndTime.minute.toString().padLeft(2, '0')}";
    } else {
      // Fallback if estimatedTime is not in expected format
      deliveryTime = "$estimatedTime - ${orderTracker.estimatedTime}";
    }

    // Initial status
    currentStatus = _statusMessages[0];
    isOnTime = true;

    // Set up animation controller
    _progressController = AnimationController(
      duration: _totalDeliveryTime,
      vsync: this,
    );

    // Create animation - initialize with a safe pattern
    _progressController.addListener(() {
      setState(() {
        // Update status message based on progress
        final value = _progressController.value;

        // Update order status in the provider as animation progresses
        var orderTracker = Provider.of<OrderTrackingProvider>(
          context,
          listen: false,
        );

        if (value < 0.33) {
          currentStatus = _statusMessages[0];
          if (orderTracker.orderStatus != _statusMessages[0]) {
            orderTracker.updateOrderStatus(_statusMessages[0]);
          }
        } else if (value < 0.66) {
          currentStatus = _statusMessages[1];
          if (orderTracker.orderStatus != _statusMessages[1]) {
            orderTracker.updateOrderStatus(_statusMessages[1]);
          }
        } else if (value < 1.0) {
          currentStatus = _statusMessages[2];
          if (orderTracker.orderStatus != _statusMessages[2]) {
            orderTracker.updateOrderStatus(_statusMessages[2]);
          }
        } else {
          currentStatus = _statusMessages[3];
          if (orderTracker.orderStatus != _statusMessages[3]) {
            orderTracker.updateOrderStatus(_statusMessages[3]);
            // Mark order as complete in the provider
            orderTracker.completeOrder();
          }
        }
      });
    });

    // Now it's safe to initialize the animation
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_progressController);

    // Start the animation
    _progressController.forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).popUntil(
              (route) => route.settings.name == '/foodscreen' || route.isFirst,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deliveryTime,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        isOnTime ? "On time" : "Delayed",
                        style: TextStyle(
                          color: isOnTime ? Colors.green : Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        " · ",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      Text(
                        currentStatus,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Use the updated progress bar
            _buildProgressBar(),

            const SizedBox(height: 16),
            Center(
              child: Text(
                _progressController.value < 0.66
                    ? "We'll let you know when it's out for delivery."
                    : _progressController.value < 1.0
                    ? "Your order is on the way!"
                    : "Your order has been delivered!",
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),

            const Divider(height: 1),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF6B35),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        "Food",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    widget.restaurant.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Save this restaurant to Favourites and find it quickly next time.",
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF6B35),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "฿${widget.totalAmount.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "฿${(widget.totalAmount + 28).toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "View order summary",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.blue, size: 20),
                  ],
                ),
              ),
            ),

            const Divider(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle, color: Colors.red, size: 12),
                      const SizedBox(width: 8),
                      Text(
                        widget.restaurant.name,
                        style: const TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.orange,
                        size: 12,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.deliveryAddress,
                        style: const TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updated progress bar with real-time animation
  Widget _buildProgressBar() {
    // Get the current progress value
    final progress = _progressController.value;

    // Calculate individual segment progress
    // Segment 1: Restaurant to Food (0-33%)
    final segment1Progress = progress <= 0.33 ? progress / 0.33 : 1.0;

    // Segment 2: Food to Delivery (33-66%)
    final segment2Progress =
        progress <= 0.33
            ? 0.0
            : progress <= 0.66
            ? (progress - 0.33) / 0.33
            : 1.0;

    // Segment 3: Delivery to Home (66-100%)
    final segment3Progress = progress <= 0.66 ? 0.0 : (progress - 0.66) / 0.34;

    // Get gradual color transitions for icons
    Color getFoodIconColor() {
      if (progress < 0.33) {
        // Gradually change from grey to orange
        return Color.lerp(
              Colors.grey,
              const Color(0xFFFF6B35),
              segment1Progress,
            ) ??
            Colors.grey;
      }
      return const Color(0xFFFF6B35);
    }

    Color getDeliveryIconColor() {
      if (progress < 0.33) {
        return Colors.grey;
      } else if (progress < 0.66) {
        // Gradually change from grey to orange
        return Color.lerp(
              Colors.grey,
              const Color(0xFFFF6B35),
              segment2Progress,
            ) ??
            Colors.grey;
      }
      return const Color(0xFFFF6B35);
    }

    Color getHomeIconColor() {
      if (progress < 0.66) {
        return Colors.grey;
      } else {
        // Gradually change from grey to orange
        return Color.lerp(
              Colors.grey,
              const Color(0xFFFF6B35),
              segment3Progress,
            ) ??
            Colors.grey;
      }
    }

    // Get background colors for icons with gradual transition
    Color getFoodIconBgColor() {
      if (progress < 0.33) {
        return Color.lerp(
              Colors.grey.shade200,
              const Color(0xFFFF6B35),
              segment1Progress,
            ) ??
            Colors.grey.shade200;
      }
      return const Color(0xFFFF6B35);
    }

    Color getDeliveryIconBgColor() {
      if (progress < 0.33) {
        return Colors.grey.shade200;
      } else if (progress < 0.66) {
        return Color.lerp(
              Colors.grey.shade200,
              const Color(0xFFFF6B35),
              segment2Progress,
            ) ??
            Colors.grey.shade200;
      }
      return const Color(0xFFFF6B35);
    }

    Color getHomeIconBgColor() {
      if (progress < 0.66) {
        return Colors.grey.shade200;
      } else {
        return Color.lerp(
              Colors.grey.shade200,
              const Color(0xFFFF6B35),
              segment3Progress,
            ) ??
            Colors.grey.shade200;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Restaurant icon (A)
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFFF6B35),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                "A",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),

          // First progress line (Restaurant to Food Preparation) - Smooth gradient
          Expanded(
            child: Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFF6B35),
                    progress < 0.33
                        ? Colors.grey.shade300
                        : const Color(0xFFFF6B35),
                  ],
                  stops: [segment1Progress, segment1Progress],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Food preparation icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: getFoodIconBgColor(),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.restaurant,
              color:
                  getFoodIconColor() == const Color(0xFFFF6B35)
                      ? Colors.white
                      : getFoodIconColor(),
            ),
          ),

          // Second progress line (Food Preparation to Delivery) - Smooth gradient
          Expanded(
            child: Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    progress < 0.33
                        ? Colors.grey.shade300
                        : const Color(0xFFFF6B35),
                    progress < 0.66
                        ? Colors.grey.shade300
                        : const Color(0xFFFF6B35),
                  ],
                  stops: [0.0, segment2Progress],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Delivery icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: getDeliveryIconBgColor(),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.delivery_dining,
              color:
                  getDeliveryIconColor() == const Color(0xFFFF6B35)
                      ? Colors.white
                      : getDeliveryIconColor(),
            ),
          ),

          // Third progress line (Delivery to Home) - Smooth gradient
          Expanded(
            child: Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    progress < 0.66
                        ? Colors.grey.shade300
                        : const Color(0xFFFF6B35),
                    progress < 0.66
                        ? Colors.grey.shade300
                        : const Color(0xFFFF6B35),
                  ],
                  stops: [0.0, segment3Progress],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Home icon - Keep the icon visible even when complete
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: getHomeIconBgColor(),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.home,
              color: progress > 0.99 ? Colors.white : getHomeIconColor(),
            ),
          ),
        ],
      ),
    );
  }
}
