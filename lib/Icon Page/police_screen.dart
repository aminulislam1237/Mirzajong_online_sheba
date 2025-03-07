import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PoliceScreen extends StatelessWidget {
  const PoliceScreen({super.key});

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("পুলিশ স্টেশন"),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Contact Details
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
                      const ListTile(
                        leading: Icon(Icons.contact_mail_sharp, color: Colors.green),
                        title: Text("এমডি সিয়াম "),
                      ),
                      const ListTile(
                        leading: Icon(Icons.phone, color: Colors.green),
                        title: Text("+৮৮০ ১২৩৪ ৫৬৭ ৮৯০"),
                      ),
                      const ListTile(
                        leading: Icon(Icons.location_on, color: Colors.green),
                        title: Text("মির্জাগঞ্জ, ঢাকা, বাংলাদেশ"),
                      ),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _makePhoneCall("+8801234567890");
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
                      const ListTile(
                        leading: Icon(Icons.contact_mail_sharp, color: Colors.green),
                        title: Text("এমডি সিয়াম "),
                      ),
                      const ListTile(
                        leading: Icon(Icons.phone, color: Colors.green),
                        title: Text("+৮৮০ ১২৩৪ ৫৬৭ ৮৯০"),
                      ),
                      const ListTile(
                        leading: Icon(Icons.location_on, color: Colors.green),
                        title: Text("মির্জাগঞ্জ, ঢাকা, বাংলাদেশ"),
                      ),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _makePhoneCall("+8801234567890");
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
                      const ListTile(
                        leading: Icon(Icons.contact_mail_sharp, color: Colors.green),
                        title: Text("এমডি সিয়াম "),
                      ),
                      const ListTile(
                        leading: Icon(Icons.phone, color: Colors.green),
                        title: Text("+৮৮০ ১২৩৪ ৫৬৭ ৮৯০"),
                      ),
                      const ListTile(
                        leading: Icon(Icons.location_on, color: Colors.green),
                        title: Text("মির্জাগঞ্জ, ঢাকা, বাংলাদেশ"),
                      ),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _makePhoneCall("+8801234567890");
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
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
