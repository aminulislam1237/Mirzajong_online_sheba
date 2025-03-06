import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostOfficeScreen extends StatelessWidget {
  const PostOfficeScreen({super.key});

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
        title: const Text("পোস্ট অফিস"),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Banner Image

            const SizedBox(height: 200),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "সুবিদখালী পোস্ট অফিস",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.green),
                        title: Text("+880 1854-152611"),
                      ),

                      ListTile(
                        leading: Icon(Icons.email, color: Colors.green),
                        title: Text("পোস্টাল কোড: ৮৬১০"),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.green),
                        title: Text("মির্জাগন্ঞ্জ, পটুয়াখালী, বাংলাদেশ"),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Phone Button
            Padding(
              padding: const EdgeInsets.all(16.0),
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
    );
  }
}
