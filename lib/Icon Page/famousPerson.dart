import 'package:flutter/material.dart';

class FamousPersonScreen extends StatelessWidget {
  FamousPersonScreen({super.key});

  final List<Map<String, String>> famousPeople = [
    {
      'name': 'হযরত ইয়ার উদ্দিন খলিফা সা. রহ.',
      'profession': 'সুফি সাধক',
      'notable': 'বিশিষ্ট ইসলাম প্রচারক, আল্লাহর ওলি।',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'আলতাফ হোসেন চৌধুরী',
      'profession': 'সাবেক বিমান বাহিনী প্রধান',
      'notable': 'সাবেক এমপি, সাবেক স্বরাষ্ট্র ও বানিজ্য মন্ত্রী, বাংলাদেশ সরকার।',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'জাফর ইমাম শিকদার',
      'profession': 'পরিচালক',
      'notable': 'রেড ক্রিসেন্ট সোসাইটি',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'জাহাঙ্গীর হোসেন',
      'profession': 'সাবেক সচিব',
      'notable': 'সাবেক স্বরাষ্ট্র ও নির্বাচন কমিশন সচিব',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'শাহজাহান মিয়া',
      'profession': 'সচিব',
      'notable': ' প্রশাসক ঢাকা দক্ষিণ সিটি করপোরেশনও অতিরিক্ত সচিব, স্থানীয় সরকার বিভাগ',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'রুহুল আমিন শিপার',
      'profession': 'ডিআইজি',
      'notable': 'বাংলাদেশ পুলিশ',
      'image': 'assets/icon/man.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('বিশিষ্ট ব্যক্তিবর্গ'),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: famousPeople.length,
        itemBuilder: (context, index) {
          final person = famousPeople[index];
          return FamousPersonCard(
            name: person['name']!,
            profession: person['profession']!,
            notable: person['notable']!,
            image: person['image']!,
          );
        },
      ),
    );
  }
}

class FamousPersonCard extends StatelessWidget {
  final String name;
  final String profession;
  final String notable;
  final String image;

  const FamousPersonCard({
    super.key,
    required this.name,
    required this.profession,
    required this.notable,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              profession,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              notable,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
