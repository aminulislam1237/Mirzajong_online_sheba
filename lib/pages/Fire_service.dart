import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FireServiceInfoScreen extends StatelessWidget {
  FireServiceInfoScreen({super.key});

  final List<Map<String, String>> fireServices = [
    {
      'name': 'মোঃ সুমন',
      'address': 'ফায়ার সার্ভিস স্টেশন,মির্জাগঞ্জ, পটুয়াখালী',
      'phoneNumber': '01234567890',
      'image': 'assets/icon/man.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ফায়ার সার্ভিস'),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: fireServices.length,
        itemBuilder: (context, index) {
          final fireService = fireServices[index];
          return FireServiceCard(
            name: fireService['name']!,
            address: fireService['address']!,
            phoneNumber: fireService['phoneNumber']!,
            image: fireService['image']!,
          );
        },
      ),
    );
  }
}

class FireServiceCard extends StatelessWidget {
  final String name;
  final String address;
  final String phoneNumber;
  final String image;

  const FireServiceCard({
    super.key,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(address, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => _launchCaller(phoneNumber),
                child: Text(phoneNumber,
                    style: const TextStyle(color: Colors.blue)),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchCaller(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        print('Could not launch $launchUri'); // Use print for debugging
        // Optionally, show an error message to the user.
      }
    } catch (e) {
      print('Error launching URL: $e'); // Catch potential exceptions
      // Optionally, show an error message to the user.
    }
  }
}
