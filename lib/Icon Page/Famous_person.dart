import 'package:flutter/material.dart';


class FamousPerson extends StatelessWidget {
  const FamousPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("বিখ্যাত ব্যাক্তিত্ব"),
        backgroundColor: Colors.greenAccent,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ContactCard(
              name: "হযরত ইয়ার উদ্দিন খলিফা সা. রহ.",
              address: " সুফি সাধক, বিশিষ্ট ইসলাম প্রচারক, আল্লাহর ওলি।",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: "আলতাফ হোসেন চৌধুরী",
              address: " সাবেক স্বরাষ্ট্র মন্ত্রী ও বানিজ্য মন্ত্রী,",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: "জাফর ইমাম শিকদার",
              address: "পরিচালক, রেড ক্রিসেন্ট সোসাইটি",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: "জাহাঙ্গীর হোসেন",
              address: " সাবেক বিমান বাহিনী প্রধান, সাবেক এমপি- পটুয়াখালী-১, সাবেক স্বরাষ্ট্র ও বানিজ্য মন্ত্রী,বাংলাদেশ সরকার",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: "জাফর ইমাম শিকদার",
              address: "পরিচালক, রেড ক্রিসেন্ট সোসাইটি",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: "শাহজাহান মিয়া",
              address: " প্রশাসক, ঢাকা দক্ষিণ সিটি করপোরেশন ও অতিরিক্ত সচিব স্হানীয় সরকার বিভাগ",
            ),
            SizedBox(height: 20),
            ContactCard(
              name: " রুহুল আমিন শিপার",
              address: " ডিআইজি,বাংলাদেশ পুলিশ",
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
  final String address;

  const ContactCard({
    super.key,
    required this.name,
    required this.address,
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
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.green),
                title: Text(name),
              ),
              ListTile(
                leading: const Icon(Icons.work_outline, color: Colors.green),
                title: Text(address),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
