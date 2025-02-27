import 'package:flutter/material.dart';

import '../Model/union.dart';

class HistoricalPleaceScreen extends StatelessWidget {
  const HistoricalPleaceScreen({super.key});

  static List<Union> unions = [
    // static const
    Union(
      name: '১।   মাধবখালী',
      description: 'এক নজরে মাধবখালী ইউনিয়ন',
      area: '৩৪ বর্গ কিলোমিটার',
      population: '২২১০০',
      literacyRate: '৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-৭টি।',
      madrasha: 'মাদ্রাসা:-ফাজিল-১টি, আলিম-৪টি,দাখিল-১১টি।',
      mosjit: 'মসজিদ সংখ্যা-১২৫টি।',
    ),
    Union(
      name: '২।   মির্জাগঞ্জ',
      description: 'এক নজরে মির্জাগঞ্জ ইউনিয়ন',
      area: 'আয়তন- ৩৪ বর্গ কিলোমিটার',
      population: 'লোক সংখ্যা-মোট-২২১০০ পুরুষ-১১০৭৩ মহিলা-১১০২৭ জন।',
      literacyRate: 'শিক্ষার হার-৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-৭টি।',
      madrasha: 'মাদ্রাসা:-ফাজিল-১টি, আলিম-৪টি,দাখিল-১১টি।',
      mosjit: 'মসজিদ সংখ্যা-১২৫টি।',
    ),
    Union(
      name: '৩।   আমড়াগাছিয়া',
      description: 'এক নজরে  আমড়াগাছিয়া ইউনিয়ন',
      area: 'আয়তন- ৩৪ বর্গ কিলোমিটার',
      population: 'লোক সংখ্যা-মোট-২২১০০ পুরুষ-১১০৭৩ মহিলা-১১০২৭ জন।',
      literacyRate: 'শিক্ষার হার-৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-2টি',
      madrasha: 'মাদ্রাসা ৩টি ',
      mosjit: 'মসজিদ ১০৪টি',
    ),
    Union(
      name: '৪।   দেউলী সুবিদখালী',
      description: 'মএক নজরে দেউলী সুবিদখালীজ ইউনিয়ন',
      area: 'আয়তন- ৩৪ বর্গ কিলোমিটার।',
      population: 'লোক সংখ্যা-মোট-২২১০০ পুরুষ-১১০৭৩ মহিলা-১১০২৭ জন।',
      literacyRate: 'শিক্ষার হার-৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-৭টি।',
      madrasha: 'মাদ্রাসা:-ফাজিল-১টি, আলিম-৪টি,দাখিল-১১টি।',
      mosjit: 'মসজিদ সংখ্যা-১২৫টি।',
    ),
    Union(
      name: '৫।   কাকড়াবুনিয়া',
      description: 'মিএক নজরে কাকড়াবুনিয়া ইউনিয়ন',
      area: 'আয়তন- ৩৪ বর্গ কিলোমিটার',
      population: 'লোক সংখ্যা-মোট-২২১০০ পুরুষ-১১০৭৩ মহিলা-১১০২৭ জন।',
      literacyRate: 'শিক্ষার হার-৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-5টি',
      madrasha: 'মাদ্রাসা 1টি',
      mosjit: ' মসজিদের সংখ্যা=৫৯ ',
    ),
    Union(
      name: '৬।  মসজিদবাড়ীয়া',
      description: 'মির্জাগঞ্জ সম্পর্কে তথ্য...',
      area: 'আয়তন- ৩৪ বর্গ কিলোমিটার',
      population: 'লোক সংখ্যা-মোট-২২১০০ পুরুষ-১১০৭৩ মহিলা-১১০২৭ জন।',
      literacyRate: 'শিক্ষার হার-৭০%',
      imageUrl: 'assets/icon/map.png',
      school: 'মাধ্যমিক বিদ্যালয়-5টি',
      madrasha: 'মাদ্রাসা 1টি',
      mosjit: ' মসজিদের সংখ্যা=৫৯ ',
    ),
    // ... Add other unions here (all data must be known at compile time)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ঐতিহাসিক স্থান সমূহ'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
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
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () {
          _showDialogBox(context, union);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (union.imageUrl.isNotEmpty)
                Image.asset(
                  union.imageUrl,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  union.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(union.description),
                const SizedBox(height: 8),
                Text('আয়তন: ${union.area}'),
                Text('জনসংখ্যা: ${union.population}'),
                Text('শিক্ষার হার: ${union.literacyRate}'),
                Text('বিদ্যালয়: ${union.school}'),
                Text('মাদ্রাসা: ${union.madrasha}'),
                Text('মসজিদ: ${union.mosjit}'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('বন্ধ',style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
                onPressed: (){
                  // add share button here
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("শেয়ার করুন",style: TextStyle(color: Colors.white),))
          ],
        );
      },
    );
  }
}