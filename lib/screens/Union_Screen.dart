import 'package:flutter/material.dart';

import '../Model/union.dart';

class UnionScreen extends StatelessWidget {
  const UnionScreen({super.key});

  static List<Union> unions = [
    // static const
    Union(
      name: '১।   মাধবখালী',
      description: 'এক নজরে মাধবখালী ইউনিয়ন',
      area: '৩৪ বর্গ কিলোমিটার',
      population: '২২১০০',
      literacyRate: '৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-২',
      madrasha: 'মাদ্রাসা:২',
      mosjit: 'মসজিদ সংখ্যা-৪০টি।',
    ),
    Union(
      name: '২।   মির্জাগঞ্জ',
      description: 'এক নজরে মির্জাগঞ্জ ইউনিয়ন',
      area: 'আয়তন- ৩৬ বর্গ কিলোমিটার',
      population: 'লোক সংখ্যা-মোট-২৫৬০০ ',
      literacyRate: 'শিক্ষার হার-৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-৭টি।',
      madrasha: 'মাদ্রাসা:-ফাজিল-১টি, আলিম-৪টি,দাখিল-১১টি।',
      mosjit: 'মসজিদ সংখ্যা-১০৫টি।',
    ),
    Union(
      name: '৩।   আমড়াগাছিয়া',
      description: 'এক নজরে  আমড়াগাছিয়া ইউনিয়ন',
      area: 'আয়তন- ৩৩ বর্গ কিলোমিটার',
      population: 'লোক সংখ্যা-মোট-২০১০০ ',
      literacyRate: 'শিক্ষার হার-৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-2টি',
      madrasha: 'মাদ্রাসা ৩টি ',
      mosjit: 'মসজিদ ১০৪টি',
    ),
    Union(
      name: '৪।   দেউলী সুবিদখালী',
      description: 'মএক নজরে দেউলী সুবিদখালীজ ইউনিয়ন',
      area: 'আয়তন- ৩৫ বর্গ কিলোমিটার।',
      population: 'লোক সংখ্যা-মোট-৫০৫৫০',
      literacyRate: 'শিক্ষার হার-৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-৭টি।',
      madrasha: 'মাদ্রাসা:-ফাজিল-১টি, আলিম-৪টি,দাখিল-১১টি।',
      mosjit: 'মসজিদ সংখ্যা-১২৫টি।',
    ),
    Union(
      name: '৫।   কাকড়াবুনিয়া',
      description: 'মিএক নজরে কাকড়াবুনিয়া ইউনিয়ন',
      area: 'আয়তন- ৩৪ বর্গ কিলোমিটার',
      population: 'লোক সংখ্যা-মোট-১৮১০৬ ',
      literacyRate: 'শিক্ষার হার-৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-৪টি',
      madrasha: 'মাদ্রাসা ০',
      mosjit: ' মসজিদের সংখ্যা=৬০ ',
    ),
    Union(
      name: '৬।  মসজিদবাড়ীয়া',
      description: 'মির্জাগঞ্জ সম্পর্কে তথ্য...',
      area: 'আয়তন- ৩১ বর্গ কিলোমিটার',
      population: 'লোক সংখ্যা-মোট-১২১০০',
      literacyRate: 'শিক্ষার হার-৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-২টি',
      madrasha: 'মাদ্রাসা 1টি',
      mosjit: ' মসজিদের সংখ্যা=৮৬ ',
    ),
    // ... Add other unions here (all data must be known at compile time)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          // Use ListView.builder for dynamic list
          itemCount: unions.length,
          itemBuilder: (context, index) {
            return _buildUnionItem(context, unions[index]);
          },
        ),
      ),
    );
  }

  Widget _buildUnionItem(BuildContext context, Union union) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          _showDialogBox(context, union);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Use Row to place image and title side by side
            children: [
              if (union.imageUrl.isNotEmpty) // Conditionally show image
                Image.asset(
                  union.imageUrl,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              const SizedBox(width: 16),
              Text(
                union.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialogBox(BuildContext context, Union union) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(union.name),
          content: SingleChildScrollView(
            child: Column(
              // Display data in a Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(union.description),
                const SizedBox(height: 8),
                Text('আয়তন: ${union.area}'),
                Text('জনসংখ্যা: ${union.population}'),
                Text('শিক্ষার হার: ${union.literacyRate}'),
                // ... other data
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('বন্ধ'),
            ),
          ],
        );
      },
    );
  }
}
