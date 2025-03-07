import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MarriageCenterScreen extends StatelessWidget {
  const MarriageCenterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("বিবাহ কেন্দ্র"),
        backgroundColor: Colors.greenAccent,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            MarriageCenterCard(
              name: "মোঃ রফিকুল ইসলাম",
              address: "১ নং মাধবখালী ইউনিয়ন",
              phoneNumber: "01712578861",
            ),
            SizedBox(height: 20),
            MarriageCenterCard(
              name: "মোঃ শাহ আলম",
              address: "২ নং মির্জাগন্ঞ্জ ইউনিয়ন",
              phoneNumber: "01716925854",
            ),
            SizedBox(height: 20),
            MarriageCenterCard(
              name: "মোঃ রফিকুল ইসলাম",
              address: "৩ নং আমড়াগাছিয়া ইউনিয়ন",
              phoneNumber: "01712113984",
            ),
            SizedBox(height: 20),
            MarriageCenterCard(
              name: "মোঃ ওয়ালী উদ্দীন",
              address: "৪ নং দেউলি সুবিদখালী ইউনিয়ন",
              phoneNumber: "01721538881",
            ),
            SizedBox(height: 20),
            MarriageCenterCard(
              name: "মোঃ মাসুম বিল্লাহ",
              address: "৫ নং কাকড়াবুনিয়া ইউনিয়ন",
              phoneNumber: "01712494771",
            ),
            SizedBox(height: 20),
            MarriageCenterCard(
              name: "মোঃ আবুল কালাম আজাদ",
              address: "৬ নং মজিদবাড়িয়া ইউনিয়ন",
              phoneNumber: "01715534659",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class MarriageCenterCard extends StatelessWidget {
  final String name;
  final String address;
  final String phoneNumber;

  const MarriageCenterCard({
    super.key,
    required this.name,
    required this.address,
    required this.phoneNumber,
  });

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              ListTile(
                leading: const Icon(Icons.person, color: Colors.green),
                title: Text(name),
              ),
              ListTile(
                leading: const Icon(Icons.location_on, color: Colors.green),
                title: Text(address),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: Text(phoneNumber),
                onTap: () => _makePhoneCall(phoneNumber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
