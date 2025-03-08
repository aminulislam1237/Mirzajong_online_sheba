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
              location: " তিন রাস্তার মোড়, সুবিদখালী",
              phoneNumber: '০১৭১৭০৬১৪৭৪',
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
                onTap: () {},
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
