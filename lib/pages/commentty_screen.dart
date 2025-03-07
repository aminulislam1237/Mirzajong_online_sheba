import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommitteeScreen extends StatelessWidget {
  const CommitteeScreen({super.key});

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
      leading: const Icon(Icons.groups),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সংগঠন'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildNewspaperTile('পমির্জাগন্ঞ্জ উপজেলা স্টুডেন্টস’ ফোরাম, ঢাকা', 'https://facebook.com/groups/MUSF2011/', context),
            const SizedBox(height: 8),
            _buildNewspaperTile('মির্জাগন্ঞ্জ উপজেলা স্টুডেন্টস ওয়েব', 'https://facebook.com/groups/www.musw.info/', context),
            const SizedBox(height: 8),
            _buildNewspaperTile('মির্জাগন্ঞ্জ উপজেলা স্টুডেন্টস কমিউনিটি, ঢাকা', 'https://facebook.com/groups/470012907440596/', context),
            const SizedBox(height: 8),
            _buildNewspaperTile('মির্জাগন্ঞ্জ উপজেলা স্টুডেন্টস অ্যাসোসিয়েশন, বরিশাল', 'https://facebook.com/groups/759275164160737/', context),
            const SizedBox(height: 8),
            _buildNewspaperTile('মির্জাগন্ঞ্জ ফাউন্ডেশন', 'https://facebook.com/groups/512725322873909/', context),
            // Add more newspaper links here
          ],
        ),
      ),
    );
  }
}