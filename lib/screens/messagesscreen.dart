import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MessagesScreenState();
  }
}

class _MessagesScreenState extends State<MessagesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showDeleteIcon = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _showDeleteIcon = _tabController.index == 1;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (_showDeleteIcon)
            IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {},
            ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F6F8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: const Color(0XFFFF6B35),
                borderRadius: BorderRadius.circular(25),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              tabs: [
                SizedBox(
                  width: double.infinity,
                  child: const Tab(text: 'Chats'),
                ),
                SizedBox(
                  width: double.infinity,
                  child: const Tab(text: 'Notifications'),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildChatsTab(), _buildNotificationsTab()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/customer-service.png',
            height: 150,
            width: 150,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 150,
                width: 150,
                color: Color(0XFFFF6B35).withAlpha((0.1 * 255).toInt()),
                child: Icon(
                  Icons.support_agent,
                  size: 80,
                  color: Color(0XFFFF6B35),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Find your chats with our support\nspecialists here!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              children: [
                const TextSpan(
                  text: 'You can also get help from them via our ',
                ),
                TextSpan(
                  text: 'Help Centre',
                  style: TextStyle(
                    color: Color(0XFFFF6B35),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsTab() {
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'New restaurant partner: Sweet Basil',
        'subtitle': 'Use 499 points for a 30% discount on your first order*',
        'time': '2:05 PM',
        'isUnread': true,
      },
      {
        'title': '📢 Don\'t miss! Bundle of meal vouchers...',
        'subtitle': 'Great value meal deals, click to see more! 🔥',
        'time': '12:15 PM',
        'isUnread': true,
      },
      {
        'title': '📢 Limited time offer! Special meals...',
        'subtitle': 'Value for your money, check out now! 🔥',
        'time': '12:14 PM',
        'isUnread': true,
      },
      {
        'title': 'Free Dessert with Every Main Course...',
        'subtitle': 'Ad · Sweet Delights Bakery',
        'time': '',
        'isUnread': false,
        'isAd': true,
      },
      {
        'title': '🍜 AroiGo Lunch Special Deal...',
        'subtitle': 'Order lunch for less! Use code \'LUNCH\' for 50% off*🍽️',
        'time': '10:33 AM',
        'isUnread': true,
      },
      {
        'title': '🍕 Weekend Pizza Party Discount...',
        'subtitle':
            'Perfect for gatherings! Use code \'WEEKEND\' for 40% off*🍕',
        'time': '10:33 AM',
        'isUnread': true,
      },
      {
        'title': '🏁 AroiGo Mega Sale is back...',
        'subtitle':
            'Meals starting at \$5* with extra 60% off* code \'FOOD\'...',
        'time': '9:35 AM',
        'isUnread': true,
      },
      {
        'title': '🍲 Local Restaurant Week on AroiGo...',
        'subtitle': 'Support local chefs with 50% off using code \'LOCAL\'...',
        'time': '9:33 AM',
        'isUnread': true,
      },
      {
        'title': '🍱 New Premium Restaurant Collection',
        'subtitle': 'Discover fine dining at home with free delivery*',
        'time': '2:05 PM',
        'isUnread': true,
      },
      {
        'title': '📢 Flash Sale! 1-hour deals on meals...',
        'subtitle': 'Amazing deals on selected restaurants! 🔥',
        'time': '12:15 PM',
        'isUnread': true,
      },
      {
        'title': '🍔 Fast food favorites at 40% off...',
        'subtitle': 'Burgers, fries and more at great prices! 🔥',
        'time': '12:14 PM',
        'isUnread': true,
      },
      {
        'title': 'Free Bubble Tea with Orders over \$15...',
        'subtitle': 'Ad · Tea Time Cafe',
        'time': '',
        'isUnread': false,
        'isAd': true,
      },
      {
        'title': '🥘 Dinner Time Special Offers...',
        'subtitle': 'Order dinner now with code \'DINNER\' for 45% off*🍽️',
        'time': '10:33 AM',
        'isUnread': true,
      },
      {
        'title': '🍣 Sushi Day on AroiGo...',
        'subtitle':
            'All sushi restaurants with 30% off today! Code \'SUSHI\'*🍣',
        'time': '10:33 AM',
        'isUnread': true,
      },
      {
        'title': '🥗 Healthy Eating Week is here...',
        'subtitle':
            'Fresh salads and healthy meals from \$6* with code \'HEALTH\'...',
        'time': '9:35 AM',
        'isUnread': true,
      },
      {
        'title': '🔔 Your favorite restaurants miss you!',
        'subtitle':
            'Come back and enjoy 50% off your next order with \'BACK\'...',
        'time': '9:33 AM',
        'isUnread': true,
      },
    ];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEEE0),
                borderRadius: BorderRadius.circular(25),
              ),
              child:
                  notification['isAd'] == true
                      ? const Icon(
                        Icons.campaign,
                        color: Colors.deepOrange,
                        size: 24,
                      )
                      : const Icon(
                        Icons.local_offer,
                        color: Colors.deepOrange,
                        size: 24,
                      ),
            ),
            title: Text(
              notification['title'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              notification['subtitle'],
              style: const TextStyle(fontSize: 14, color: Colors.black54),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (notification['time'].isNotEmpty)
                  Text(
                    notification['time'],
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                const SizedBox(height: 4),
                if (notification['isUnread'] == true)
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}
