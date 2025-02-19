import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:musf_app1/screens/Home_screen.dart';
import '../widgets/custom_drawer.dart';
import 'Add_Info_Screen.dart';
import 'EmergencyScreen.dart';
import 'More_Screen.dart';
import 'Union_Screen.dart';

class HomeScreenState extends StatefulWidget {
  const HomeScreenState({super.key});

  @override
  _HomeScreenStateState createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Emergencyscreen(),
    const AddInfoScreen(),
    const UnionScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 5,
        shadowColor: Colors.black45,
        title: const Text(
          "মিরজাগঞ্জ স্টুডেন্ট ফোরাম , ঢাকা",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.blueGrey),
            onPressed: () {
              // Notification action
            },
          ),
        ],
      ),

      /// Drawer with Enhanced UI
      drawer: CustomDrawer(),

      /// Body with Page Transition
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _pages[_currentIndex],
      ),

      /// Bottom Navigation Bar with Animation
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.greenAccent,
        buttonBackgroundColor: Colors.white,
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
              Icon(Icons.add_circle_outline_outlined, size: 30, color: Colors.teal),
              Text("তথ্য দিন", style: TextStyle(fontSize: 10, color: Colors.teal)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.maps_home_work_outlined, size: 30, color: Colors.teal),
              Text("ইউনিয়ন", style: TextStyle(fontSize: 10, color: Colors.teal)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.more_horiz_rounded, size: 30, color: Colors.black54),
              Text("আরও", style: TextStyle(fontSize: 10, color: Colors.black54)),
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

  /// Refactored ListTile Builder
  Widget _buildListTile(BuildContext context, IconData icon, String title,
      Widget? destination) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      onTap: () {
        if (destination != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}
