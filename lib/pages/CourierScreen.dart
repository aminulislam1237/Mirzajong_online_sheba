import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourierScreen extends StatelessWidget {
  const CourierScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("কুরিয়ার সার্ভিস"),
        backgroundColor: Colors.greenAccent,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CourierContactCard(
              name: "সুন্দরবন কুরিয়ার সার্ভিস",
              location: "ঢাকা, বাংলাদেশ",
              phoneNumber: '+8801711000000',
            ),
            SizedBox(height: 20),
            CourierContactCard(
              name: "এস এ পরিবহন",
              location: "চট্টগ্রাম, বাংলাদেশ",
              phoneNumber: '+8801811000000',
            ),
            SizedBox(height: 20),
            CourierContactCard(
              name: "জননী কুরিয়ার সার্ভিস",
              location: "খুলনা, বাংলাদেশ",
              phoneNumber: '+8801911000000',
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CourierContactCard extends StatelessWidget {
  final String name;
  final String location;
  final String phoneNumber;

  const CourierContactCard({
    super.key,
    required this.name,
    required this.location,
    required this.phoneNumber,
  });

  void _launchMap(String location) async {
    String query = Uri.encodeComponent(location);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
    final Uri url = Uri.parse(googleUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the map.';
    }
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
                leading: const Icon(Icons.local_shipping, color: Colors.green),
                title: Text(name),
              ),
              ListTile(
                leading: const Icon(Icons.location_on, color: Colors.green),
                title: Text(location),
                onTap: () => _launchMap(location),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: Text(phoneNumber),
                onTap: () => launchUrl(Uri.parse('tel:$phoneNumber')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
