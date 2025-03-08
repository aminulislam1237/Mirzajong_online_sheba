import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RentCarScreen extends StatelessWidget {
  const RentCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("রেন্ট এ কার "),
        backgroundColor: Colors.greenAccent,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ContactCard(
              name: "খান রেন্ট-এ-কার সার্ভিস",
              phoneNumber: "01729184398",
              address: "সুবিদখালি,মির্জাগঞ্জ,পটুয়াখালি ",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: "বিসমিল্লাহ রেন্ট-এ-কার সার্ভিস",
              phoneNumber: "০১৯২৪২৫৮৭৬৯",
              address: "সুবিদখালি,মির্জাগঞ্জ,পটুয়াখালি",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String address;

  const ContactCard({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.address,
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
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.directions_car_filled,
                    color: Colors.green),
                title: Text(name),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: Text(phoneNumber),
              ),
              ListTile(
                leading: const Icon(Icons.location_on, color: Colors.green),
                title: Text(address),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _makePhoneCall(phoneNumber);
                  },
                  icon: const Icon(Icons.phone),
                  label: const Text("এখনই কল করুন"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
