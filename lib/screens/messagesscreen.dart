import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showDeleteIcon = false; // Initially false since we start on Chats tab

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Listen for tab changes to update delete icon visibility
    _tabController.addListener(() {
      setState(() {
        // Show delete icon only on Notifications tab (index 1)
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
          // Only show the delete icon when on Notifications tab
          if (_showDeleteIcon)
            IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {
                // Handle delete action
              },
            ),
        ],
      ),
      body: Column(
        children: [
          // Custom tab bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 50, // Set a fixed height
            decoration: BoxDecoration(
              color: const Color(0xFFE8F6F8), // Light blue/gray background
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              controller: _tabController,
              // Use indicator size to cover the full tab
              indicator: BoxDecoration(
                color: const Color(0xFF174F4B), // Dark green active tab
                borderRadius: BorderRadius.circular(25),
              ),
              // Make indicator cover full tab
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white, // White text when selected
              unselectedLabelColor:
                  Colors.black, // Black text when not selected
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              // Important: Set tab padding to 0 to make tabs fill all available space
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              tabs: [
                // Use Tab with fixed width to ensure equal tab widths
                Container(
                  width: double.infinity,
                  child: const Tab(text: 'Chats'),
                ),
                Container(
                  width: double.infinity,
                  child: const Tab(text: 'Notifications'),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Chats Tab Content
                _buildChatsTab(),

                // Notifications Tab Content
                _buildNotificationsTab(),
              ],
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
          // Support specialist image
          Image.asset(
            'assets/images/support_specialist.png',
            height: 150,
            width: 150,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 150,
                width: 150,
                color: Colors.green.shade200,
                child: Icon(
                  Icons.support_agent,
                  size: 80,
                  color: Colors.green.shade700,
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
                    color: Colors.green.shade400,
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
    // Sample notification data
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'ชวนมาเสริมความมั่นใจไปกับ Sabina',
        'subtitle': 'ใช้ 499 พอยต์ แลกรับส่วนลด 30%*',
        'time': '2:05 PM',
        'isUnread': true,
      },
      {
        'title': '📢 ห้ามพลาด! มัดรวมโค้ดลดมาให้แ...',
        'subtitle': 'มีแต่คุ้มกับคุ้ม คลิกดูได้เลย! 🔥',
        'time': '12:15 PM',
        'isUnread': true,
      },
      {
        'title': '📢 ห้ามพลาด! มัดรวมโค้ดลดมาให้แ...',
        'subtitle': 'มีแต่คุ้มกับคุ้ม คลิกดูได้เลย! 🔥',
        'time': '12:14 PM',
        'isUnread': true,
      },
      {
        'title': 'Free Carnation Condensed Milk with Ev...',
        'subtitle': 'Ad · F&N Dairies (Thailand) Ltd.',
        'time': '',
        'isUnread': false,
        'isAd': true,
      },
      {
        'title': '[Transport] ⬇️ GrabCar Saver U...',
        'subtitle': 'ค่ารถถูกลง! ใส่โค้ด \'GUMEGA\' ลด 50%*🚗',
        'time': '10:33 AM',
        'isUnread': true,
      },
      {
        'title': '[Transport] ⬇️ GrabCar Saver U...',
        'subtitle': 'ค่ารถถูกลง! ใส่โค้ด \'GUMEGA\' ลด 50%*🚗',
        'time': '10:33 AM',
        'isUnread': true,
      },
      {
        'title': '🏁 GrabFood Mega Sale กลับมาแ...',
        'subtitle': 'ทุกมื้อเริ่มต้น ฿19* ลดเพิ่ม 60%* ใส่โค้ด \'MEGA\'...',
        'time': '9:35 AM',
        'isUnread': true,
      },
      {
        'title': '🏁 GrabFood Mega Sale กลับมาแ...',
        'subtitle': 'ทุกมื้อเริ่มต้น ฿19* ลดเพิ่ม 60%* ใส่โค้ด \'MEGA\'...',
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
            onTap: () {
              // Handle notification tap
            },
          ),
        );
      },
    );
  }
}
