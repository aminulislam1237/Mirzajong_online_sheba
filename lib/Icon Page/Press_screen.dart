import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PressScreen extends StatelessWidget {
  const PressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("সাংবাদিক", style: GoogleFonts.notoSansBengali()),
        backgroundColor: Colors.greenAccent,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            PressContactCard(
              name: "জাকির হোসেন",
              phone: "+8801712603415",
              designation: "দৈনিক প্রথম আলো",
            ),
            SizedBox(height: 20),
            PressContactCard(
              name: "সাদ্দাম হোসেন",
              phone: "+8801719525635",
              designation: "দৈনিক যুগান্তর",
            ),
            SizedBox(height: 20),
            PressContactCard(
              name: "কামরুজ্জামান জুয়েল",
              phone: "+8801712966985",
              designation: "দৈনিক দিনকাল",
            ),
            SizedBox(height: 20),
            PressContactCard(
              name: "উত্তম গোলদার",
              phone: "+8801719956842",
              designation: "দৈনিক নয়া দিগন্ত",
            ),
            SizedBox(height: 20),
            PressContactCard(
              name: "মল্লিক মাকসুদ আহমেদ বায়েজিদ",
              phone: "+8801712570899",
              designation: "দৈনিক আমার দেশ",
            ),
            SizedBox(height: 20),
            PressContactCard(
              name: "সোহাগ হোসেন",
              phone: "+8801719457330",
              designation: "দৈনিক মানবজমিন",
            ),
            SizedBox(height: 20),
            PressContactCard(
              name: "সিয়াম রহমান হিমেল",
              phone: "+8801650203909",
              designation: "দৈনিক নয়া শতাব্দী",
            ),
            SizedBox(height: 20),
            PressContactCard(
              name: "অমিতাভ দাস অপু",
              phone: "+880171526740",
              designation: "দৈনিক যায়যায়দিন",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class PressContactCard extends StatelessWidget {
  final String name;
  final String phone;
  final String designation;

  const PressContactCard(
      {super.key,
      required this.name,
      required this.phone,
      required this.designation});

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
                leading: const Icon(Icons.phone, color: Colors.green),
                title: Text(phone),
              ),
              ListTile(
                leading: const Icon(Icons.work, color: Colors.green),
                title: Text(designation),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _makePhoneCall(phone);
                  },
                  icon: const Icon(Icons.phone),
                  label:  Text("কল করুন", style: GoogleFonts.notoSansBengali()),
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
