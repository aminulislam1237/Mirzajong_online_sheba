import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuserviceService extends StatelessWidget {
  const BuserviceService({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildNewspaperTile(String title, String url, String description, BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.open_in_browser, color: Colors.green),
        onTap: () => _launchURL(url),
        contentPadding: const EdgeInsets.all(16.0),
        leading: const Icon(Icons.newspaper, color: Colors.green),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('বাস সার্ভিস'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        color: Colors.grey[200], // Light background color
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'মমির্জাগন্ঞ্জ উপজেলার সকল ধরনের বাসের তথ্য ও সেবা সম্পর্কে জানতে "সুবিদখালী বাস সিনারিও" ( Subidkhali Bus Scenario ) ফেসবুক গ্রুপে যুক্ত হোন.',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildNewspaperTile(
              'গ্রুপ লিংক:',
              'https://www.facebook.com/groups/sbs24/',
              'Join our Facebook group for all bus service information in Subidkhali.',
              context,
            ),
            const SizedBox(height: 8),
            Center(child: Image.asset('assets/icon/qrcode.jpg')),

            const SizedBox(height: 16),
            // Add more newspaper links here
          ],
        ),
      ),
    );
  }
}
