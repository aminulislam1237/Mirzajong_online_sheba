import 'package:flutter/material.dart';

import '../Model/Acadamey.dart';

class AcadameyScreeen extends StatelessWidget {
  const AcadameyScreeen({super.key});

  static List<Acadamey> academies = [
    Acadamey(
      name: '১ নং মাধবখালী ইউনিয়ন',
      school1: 'চৈতা মাধ্যমিক বিদ্যালয়',
      school2: 'কাঠালতলী মাধ্যমিক বিদ্যালয়',
      school3: '',
      school4: '',
      school5: '',
      school6: 'আকখার হোসেন চৌধুরী মেমোরিয়াল কলেজ',
    ),
    Acadamey(
      name: '২ নং মির্জাগন্ঞ্জ ইউনিয়ন :',
      school1: '.মির্জাগন্ঞ্জ দরবার শরীফ মাধ্যমিক বিদ্যালয় ',
      school2: 'ভিখাখালী ইউনাইটেড মাধ্যমিক বিদ্যালয়',
      school3: 'মনোহরখালী মাধ্যমিক বিদ্যালয়',
      school4: '',
      school5: 'মির্জাগন্ঞ্জ ইয়ারিয়া আলিম মাদরাসা',
      school6: '',
    ),
    Acadamey(
      name: '৩ নং আমড়াগাছিয়া ইউনিয়ন:',
      school1: 'আমরাগাছিয়া মাধ্যমিক বিদ্যালয় ',
      school2: 'ঝাটিবুনিয়া ম,ই মাধ্যমিক বিদ্যালয়',
      school3: 'সুবিদখালী সরকারি কলেজ',
      school4: 'সুবিদখালী মহিলা কলেজ',
      school5: ' দারুসসুন্নাত ফাজিল মাদ্রাসা',
      school6: '',
    ),
    Acadamey(
      name: '৪। দেউলী সুবিদখালী',
      school1: 'সুবিদখালী সরকারি র.ই পাইলট মাধ্যমিক বিদ্যালয়',
      school2: 'সুবিদখালী আর.কে বালিকা বিদ্যালয় ',
      school3: 'চরখালী মাধ্যমিক বিদ্যালয় ',
      school4: 'দেউলি পল্লি মঙ্গল মাধ্যমিক বিদ্যালয়',
      school5: 'চত্রা মাদ্রাসা ',
      school6: 'উদয়ন ভাষা শহীদ আবদুল জব্বার মেমোরিয়াল কলেজ',
    ),
    Acadamey(
      name: '৫। কাকড়াবুনিয়া',
      school1: 'কাকড়াবুনিয়া আদর্শ মাধ্যমিক বিদ্যালয়',
      school2: 'পশ্চিম কাকড়াবুনিয়া বালিকা মাধ্যমিক বিদ্যালয়',
      school3: 'গাবুয়া জনতা মাধ্যমিক বিদ্যালয়',
      school4: 'ইসমাইল মেমোরিয়াল মাধ্যমিক বিদ্যালয়',
      school5: '',
      school6: 'কিসমতপুর দেলোয়ার হোসেন কলেজ ',
    ),
    Acadamey(
      name: '৬। মসজিদবাড়ীয়া',
      school1: 'ভয়াং শরাফতিয়া মাধ্যমিক বিদ্যালয় ',
      school2: 'সুলতানাবাদ মাধ্যমিক বিদ্যালয়',
      school3: '',
      school4: '',
      school5: '',
      school6: 'মজিদবাড়িয়া কলেজ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('শিক্ষা প্রতিষ্ঠান'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: academies.length,
          itemBuilder: (context, index) {
            return _buildAcademyItem(context, academies[index]);
          },
        ),
      ),
    );
  }

  Widget _buildAcademyItem(BuildContext context, Acadamey academy) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () {
          _showDialogBox(context, academy);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  academy.name,
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

  void _showDialogBox(BuildContext context, Acadamey academy) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(academy.name),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'বিদ্যালয়: ${academy.school1.isNotEmpty ? academy.school1 : ""}'),
                Text(
                    'বিদ্যালয়: ${academy.school2.isNotEmpty ? academy.school2 : ""}'),
                Text(
                    'বিদ্যালয়: ${academy.school3.isNotEmpty ? academy.school3 : ""}'),
                Text(
                    'বিদ্যালয়: ${academy.school4.isNotEmpty ? academy.school4 : ""}'),
                Text(
                    'মাদ্রাসা : ${academy.school5.isNotEmpty ? academy.school5 : ""}'),
                Text(
                    'কলেজ: ${academy.school6.isNotEmpty ? academy.school6 : ""}'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('বন্ধ', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                // Add share button here
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("শেয়ার করুন",
                  style: TextStyle(color: Colors.white)),
            )
          ],
        );
      },
    );
  }
}
