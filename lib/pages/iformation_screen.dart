import 'package:flutter/material.dart';

class Informationscreen extends StatelessWidget {
  const Informationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('মির্জাগঞ্জ উপজেলা'),
        backgroundColor: Colors.greenAccent, // Customize app bar color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSectionTitle('সাধারণ তথ্যাদি'),
            _buildInfoRow('জেলা', 'পটুয়াখালী'),
            _buildInfoRow('উপজেলা', 'মির্জাগঞ্জ'),
            _buildInfoRow('সীমানা',
                'উত্তরে-বাকেরগঞ্চ উপজেলা, পূর্বে-পায়রা নদী, দক্ষিণে বরগুনা সদর ও পশ্চিমে বেতাগী উপজেলা অবস্থিত।'),
            _buildInfoRow('জেলা সদর হতে দূরত্ব', '১৭ কি:মি:'),
            _buildInfoRow('আয়তন', '৯৩ বর্গ মাইল'),
            _buildInfoRow('জনসংখ্যা', '১,২৭,০৭২ জন'),
            _buildInfoRow('পুরুষ', '৬১৬৪৮ জন'),
            _buildInfoRow('মহিলা', '৬৫৪২৪ জন'),
            _buildInfoRow('লোক সংখ্যার ঘনত্ব', '৭১০ (প্রতি বর্গ কিলোমিটারে)'),
            _buildInfoRow('মোট ভোটার সংখ্যা', '১,১৩,৮৯৫ জন'),
            _buildInfoRow('পুরুষ ভোটার সংখ্যা', '৫৮০০৮ জন'),
            _buildInfoRow('মহিলা ভোটার সংখ্যা', '৫৫৮৮৭ জন'),
            _buildInfoRow('বাৎসরিক জনসংখ্যা বৃদ্ধির হার', '২.৬৫ %'),
            _buildInfoRow('নির্বাচনী এলাকা', '১১৩-পটুয়াখালী-০১'),
            _buildInfoRow('গ্রাম', '৭১ টি'),
            _buildInfoRow('মৌজা', '৬৮টি'),
            _buildInfoRow('ইউনিয়ন', '০৬ টি'),

            _buildSectionTitle('ভৌগলিক পরিচিতিঃ '),
            _buildInfoRow('অবস্থান',
                'মির্জাগঞ্জ উপজেলার শ্রীমমত্ম ও পায়রা নদীর তীরে ২২-৩র্ হতে ২২-২৯র্ উত্তর অক্ষাংশ এবং ৯০-০৮র্ হতে ৯০-১৯র্ পুর্ব দ্রাঘিমাংশে অবস্থিত।'),
            _buildInfoRow('সীমানা',
                'উত্তরে - বরিশাল জেলার বাকেরগঞ্জ উপজেলা, দক্ষিনে বরগুনা সদর জেলা, পশ্চিমে - বরগুনা জেলার বেতাগী উপজেলা, পূর্বে পায়রা নদীর পূর্ব তীরে পটুয়াখালী সদর ও বরগুনা জেলার আমতলী উপজেলা।'),
            _buildInfoRow('ইউনিয়ন সংখ্যা', '৬টি'),

            _buildSectionTitle('অন্যান্য তথ্য'),
            _buildInfoRow('মসজিদ', '৪৭০টি'),
            _buildInfoRow('মন্দির', '০৮টি'),
            _buildInfoRow('নদ-নদী', 'পায়রা নদী, শ্রমিন্ত নদী'),
            _buildInfoRow('হাট-বাজার', '২১ টি'),
            _buildInfoRow('ব্যাংক শাখা', '০৪ টি'),
            _buildInfoRow('পোস্ট অফিস/সাব পোঃ অফিস', '০২ টি'),
            _buildInfoRow('টেলিফোন এক্সচেঞ্জ', '০১ টি'),
            _buildInfoRow('ক্ষুদ্র কুটির শিল্প', 'আছে'),
            _buildInfoRow('বৃহৎ শিল্প', 'নেই'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green, // Customize title color
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Card(
      elevation: 2, // Add card elevation
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                '$label:',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Expanded(
              flex: 2,
              child: Wrap(
                children: [
                  Text(value, style: const TextStyle(fontSize: 16)), // Style the value text
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}