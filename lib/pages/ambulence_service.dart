import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulenceServiceScreen extends StatelessWidget {
  const AmbulenceServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("এম্বুলেন্স সার্ভিস"),
        backgroundColor: Colors.greenAccent,
      ),
      body:
      const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ContactCard(
              name: "মির্জাগন্ঞ্জ উপজেলা স্বাস্থ্য কমপ্লেক্স  এম্বুলেন্স -মামুন ভাই",
              phoneNumber: "+8801716909131",
              address: "সুবিদখালি,মির্জাগঞ্জ,পটুয়াখালি ",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: "ছগির এম্বুলেন্স সার্ভিস",
              phoneNumber: "01924258769",
              address: "সুবিদখালি,মির্জাগঞ্জ,পটুয়াখালি ",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: "সোহেল এম্বুলেন্স সার্ভিস",
              phoneNumber: "01777271779",
              address: "সুবিদখালি,মির্জাগঞ্জ,পটুয়াখালি ",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: "প্রবাসী এম্বুলেন্স সার্ভিস",
              phoneNumber: "01755771512",
              address: "সুবিদখালি,মির্জাগঞ্জ,পটুয়াখালি ",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: "মির্জাগন্ঞ্জ উপজেলা স্বাস্থ্য কমপ্লেক্স এম্বুলেন্স-মিজান ভাই",
              phoneNumber: "01712104989",
              address: "সুবিদখালি,মির্জাগঞ্জ,পটুয়াখালি ",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: " রনি এম্বুলেন্স সার্ভিস",
              phoneNumber: "+8801932942014",
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
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.directions_car_filled, color: Colors.green),
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
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
