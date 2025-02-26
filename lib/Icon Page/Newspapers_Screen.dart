import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewspapersScreen extends StatelessWidget {
  const NewspapersScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildNewspaperTile(String title, String url, BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.open_in_browser),
      onTap: () => _launchURL(url),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: const Icon(Icons.newspaper),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('পত্রিকার লিঙ্ক সমূহ'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildNewspaperTile('প্রথম আলো', 'https://www.prothomalo.com/', context),
            const SizedBox(height: 8),
            _buildNewspaperTile('কালের কণ্ঠ', 'https://www.kalerkantho.com/', context),
            const SizedBox(height: 8),
            _buildNewspaperTile('যুগান্তর', 'https://www.jugantor.com/', context),
            const SizedBox(height: 8),
            _buildNewspaperTile('বাংলাদেশ প্রতিদিন', 'https://www.bd-pratidin.com/', context),
            const SizedBox(height: 8),
            _buildNewspaperTile('ইত্তেফাক', 'https://www.ittefaq.com.bd/', context),
            const SizedBox(height: 8),
            _buildNewspaperTile('The Daily Star', 'https://www.thedailystar.net/', context),
            const SizedBox(height: 8),
            _buildNewspaperTile('Dhaka Tribune', 'https://www.dhakatribune.com/', context),
            // Add more newspaper links here
          ],
        ),
      ),
    );
  }
}