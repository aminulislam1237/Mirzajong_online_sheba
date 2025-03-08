import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musf_app1/screens/Home_screen.dart';
import '../widgets/custom_drawer.dart';
import 'Add_Info_Screen.dart';
import 'EmergencyScreen.dart';
import 'Profile_Screen.dart';
import 'Union_Screen.dart';

class HomeScreenState extends StatefulWidget {
  const HomeScreenState({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenState> {
  int _currentIndex = 0;
  final CollectionReference _notificationsCollection =
  FirebaseFirestore.instance.collection("Notifications");
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
      final querySnapshot = await _notificationsCollection.get();
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          _notices = querySnapshot.docs
              .map((doc) =>
          (doc.data() as Map<String, dynamic>?)?['Notifications']
          as String? ??
              '')
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
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("নোটিস:"),
          content: SizedBox(
            width: double.maxFinite,
            height: 200, // Adjust height as needed
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Notifications')
                  .snapshots(), // Replace 'notices' with your collection name
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("কোনো নোটিস নেই।"));
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data!.docs[index];
                    final noticeText = doc['Notifications'] as String? ??
                        'কোনো টেক্সট নেই'; // Replace 'text' with your field name

                    return Dismissible(
                      key: Key(doc.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.black54,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) async {
                        // Delete the document from Firestore when dismissed
                        FirebaseFirestore.instance
                            .collection('Notifications')
                            .doc(doc.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('নোটিস বাতিল করা হয়েছে')));
                      },
                      child: ListTile(
                        title: Text(noticeText),
                        trailing: IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () async {
                            // Mark as done action (you might want to update a 'done' field in Firestore instead)
                            FirebaseFirestore.instance
                                .collection('Notifications')
                                .doc(doc.id);

                            Navigator.pop(context); // Close the dialog

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                    Text('নোটিস সম্পন্ন হিসাবে চিহ্নিত করা হয়েছে')));
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('বন্ধ করুন'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }

        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('অ্যাপ থেকে বের হবেন?'),
            content: const Text('আপনি কি নিশ্চিত যে অ্যাপ থেকে বের হতে চান?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('না'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('হ্যাঁ'),
              ),
            ],
          ),
        );

        if (shouldPop == true) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
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
                  onPressed:
                  _showNotificationDialog, // Corrected this line as well
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
                Text("ইউনিয়ন",
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
      ),
    );
  }
}