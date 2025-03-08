import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WifiLineScreen extends StatelessWidget {
  const WifiLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ওয়াইফাই লাইন "),
        backgroundColor: Colors.greenAccent,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ContactCard(
              name: "সিয়াম ক্যাবল নেটওয়ার্ক",
              phoneNumber: "01714-234225",
              address: "সুবিদখালি,মির্জাগঞ্জ,পটুয়াখালি ",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: " wifi service 2",
              phoneNumber: "01966261801",
              address: "সুবিদখালি,মির্জাগঞ্জ,পটুয়াখালি ",
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
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.address,
  }) : super(key: key);

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
              const Text(
                "যোগাযোগ তথ্য",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading:
                    const Icon(Icons.contact_mail_sharp, color: Colors.green),
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
