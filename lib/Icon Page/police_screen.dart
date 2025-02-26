import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PoliceScreen extends StatelessWidget {
  const PoliceScreen({super.key});

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Could not launch phone call.')),
      );
    }
  }

  // Global key for navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  Widget _buildContactCard(BuildContext context, String name, String description,
      String phone, String email, String location, String imageAsset) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imageAsset),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Contact Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.green),
                    title: Text(phone),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.green),
                    title: Text(email),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.green),
                    title: Text(location),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () => _makePhoneCall(phone),
            icon: const Icon(Icons.phone),
            label: const Text("Call Now"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Contact Page"),
            backgroundColor: Colors.greenAccent,
            leading: IconButton( // Add back button
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  _buildContactCard(
                    context,
                    "Md rohim",
                    "Contact us for any inquiries or support. We are available 24/7.",
                    "+8801838565702",
                    "info@example.com",
                    "Mirzaganj, patuakhali, Bangladesh",
                    "assets/icon/man.png",
                  ),
                  const Divider( // Add divider
                    thickness: 1,
                    color: Colors.grey,
                    height: 48, // Adjust height as needed
                  ),
                  _buildContactCard(
                    context,
                    "MD Aminul Islam Rasel",
                    "Contact us for any inquiries or support. We are available 24/7.",
                    "+8801234567890",
                    "info@example.com",
                    "subidkhali, mirjazonji, Bangladesh",
                    "assets/icon/man.png",
                  ),
                  const Divider( // Add divider
                    thickness: 1,
                    color: Colors.grey,
                    height: 48, // Adjust height as needed
                  ),
                  _buildContactCard(
                    context,
                    "MD Aminul Islam Rasel",
                    "Contact us for any inquiries or support. We are available 24/7.",
                    "+8801234567890",
                    "info@example.com",
                    "subidkhali, mirjazonji, Bangladesh",
                    "assets/icon/man.png",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}