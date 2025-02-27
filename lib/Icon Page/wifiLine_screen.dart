import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WifiLineScreen extends StatelessWidget {
  const WifiLineScreen({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  Widget _buildContactCard(BuildContext context, String name, String description,
      String phone, String email, String location, String imageAsset) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          fontSize: 22,
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
            const Text(
              "ইন্টারনেট সার্ভিস",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: GestureDetector(
                onTap: () => _launchPhone(phone),
                child: Text(phone, style: TextStyle(color: Colors.blue)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.green),
              title: GestureDetector(
                onTap: () => _launchEmail(email),
                child: Text(email, style: TextStyle(color: Colors.blue)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.green),
              title: Text(location),
            ),
          ],
        ),
      ),
    );
  }

  void _launchPhone(String phone) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phone);
    await launchUrl(launchUri);
  }

  void _launchEmail(String email) async {
    final Uri launchUri = Uri(scheme: 'mailto', path: email);
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text('Wifi Services'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  _buildContactCard(
                    context,
                    "সিয়াম অনলাইন সার্ভিস",
                    "Contact us for any inquiries or support. We are available 24/7.",
                    "++8801716111859",
                    "info@example.com",
                    "Subidkhali, Mirzagonj, Patuakhali",
                    "assets/icon/man.png",
                  ),
                  const Divider(thickness: 1, color: Colors.grey, height: 48),
                  _buildContactCard(
                    context,
                    "Wifi service 2",
                    "Contact us for any inquiries or support. We are available 24/7.",
                    "+8801234567890",
                    "info@example.com",
                    "Subidkhali, Mirzagonj, Patuakhali",
                    "assets/icon/man.png",
                  ),
                  const Divider(thickness: 1, color: Colors.grey, height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
