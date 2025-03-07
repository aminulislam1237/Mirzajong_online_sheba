import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:musf_app1/screens/Home_screen.dart';
import '../widgets/custom_drawer.dart';
import 'Add_Info_Screen.dart';
import 'EmergencyScreen.dart';
import 'Profile_Screen.dart';
import 'Union_Screen.dart';

class HomeScreenState extends StatefulWidget {
  const HomeScreenState({super.key});

  @override
  _HomeScreenStateState createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {
  int _currentIndex = 0;
  final _firestore = FirebaseFirestore.instance.collection("Notice");
  final List<Widget> _pages = [
    const HomeScreen(),
    const Emergencyscreen(),
    const DataEntryScreen(),
    const UnionScreen(),
    const ProfileScreen(),
  ];
  List<String> _notices = []; // To store fetched notices

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  // Fetch notifications from Firestore
  Future<void> _fetchNotifications() async {
    try {
      final querySnapshot = await _firestore.get();
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          _notices = querySnapshot.docs
              .map((doc) => doc.data()['Notice'] as String)
              .toList();
        });
      } else {
        debugPrint("No notifications found.");
      }
    } catch (e) {
      debugPrint("Error fetching notifications: $e");
    }
  }

  // Show notification dialog
  void _showNotificationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Notifications"),
        content: SizedBox(
          width: double.maxFinite,
          height: 200, // Make the dialog box shorter
          child: _notices.isEmpty
              ? const Center(child: Text("No notifications."))
              : ListView.builder(
                  itemCount: _notices.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_notices[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.check, color: Colors.green),
                        onPressed: () {
                          setState(() {
                            _notices.removeAt(index); // Mark as done action
                            Navigator.pop(context); // Close the dialog
                          });
                        },
                      ),
                    );
                  },
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 5,
        shadowColor: Colors.black45,
        title: const Text(
          "মির্জাগঞ্জ তথ্য সেবা",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.blueGrey),
                onPressed: _showNotificationDialog,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: _notices.isEmpty
                    ? Container()
                    : Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            _notices.length.toString(),
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.greenAccent,
        buttonBackgroundColor: Colors.greenAccent,
        height: 50, // Increased height for label space
        index: _currentIndex,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home, size: 30, color: Colors.teal),
              Text("হোমে", style: TextStyle(fontSize: 10, color: Colors.teal)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.emergency_outlined, size: 30, color: Colors.teal),
              Text("জরুরী", style: TextStyle(fontSize: 10, color: Colors.teal)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_circle_outline_outlined,
                  size: 30, color: Colors.teal),
              Text("তথ্য দিন",
                  style: TextStyle(fontSize: 10, color: Colors.teal)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.maps_home_work_outlined, size: 30, color: Colors.teal),
              Text("ইউনিয়ন",
                  style: TextStyle(fontSize: 10, color: Colors.teal)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.more_horiz_rounded, size: 30, color: Colors.black54),
              Text("আরও",
                  style: TextStyle(fontSize: 10, color: Colors.black54)),
            ],
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
