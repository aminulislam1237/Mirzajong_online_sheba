import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:url_launcher/url_launcher.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GifView.asset(
                'assets/icons8-gmail-logo.gif',
                height: 200,
                width: 200,
                frameRate: 30,
              ),
            ),
            const Card(
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "আসসালামু আলাইকুম। আপনাদের যে কোনো উপদেশ এবং অনুপ্রেরণা আমাদেরকে উৎসাহিত করে। তাই আপনার যে কোনো তথ্যের প্রয়োজনে অথবা আপনার কোনো পরামর্শ, অভিমত বা মন্তব্য এবং উক্ত অ্যাপসের মধ্যে আপনাদের কো ব্যবসা প্রতিষ্ঠানের বিজ্ঞাপন দিতে চাইলে আমাদের নিকট আপনার তথ্য জমা দিন। আমরা খুব শীঘ্রই আপনার দেওয়া তথ্যটি যাচাই পূর্বক উক্ত অ্যাপসে সংযুক্ত করে দিব। অ্যাপটি ব্যবহার করার জন্য ধন্যবাদ।",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "আপনার তথ্য জমা দিন",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              // Added Divider here
              color: Colors.black,
              thickness: 1.0,
              indent: 20,
              endIndent: 20,
            ),
            Wrap(
              // Use Wrap instead of Row
              alignment: WrapAlignment.center, // Align items to the center
              children: [
                SocialMediaButton(
                  imagePath: 'assets/icon/whatsappicon.png',
                  onPressed: () => _launchSocialMedia('Facebook'),
                ),
                SocialMediaButton(
                  imagePath: 'assets/icon/messengericon.png',
                  onPressed: () => _launchSocialMedia('messenger'),
                ),
                SocialMediaButton(
                  imagePath: 'assets/icon/gmailicon.png',
                  onPressed: () => _launchSocialMedia('gmail'),
                ),
                SocialMediaButton(
                  imagePath: 'assets/icon/call.png',
                  onPressed: () => _launchSocialMedia('call'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchSocialMedia(String platform) async {
    String url = '';
    if (platform == 'whatsapp') {
      // Replace with your Whatsapp url
      url = "https://wa.me/880183856702";
    } else if (platform == 'messenger') {
      // Replace with your messenger url
      url = "https://m.me/aminul.islam.Rasel34";
    } else if (platform == 'gmail') {
      // Replace with your gmail url
      url = "mailto:aminul.islam20025@gmail.com";
    } else if (platform == 'call') {
      url = "tel:+8801838565702";
    }
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $platform';
    }
  }
}

class SocialMediaButton extends StatelessWidget {
  final String? imagePath;
  final IconData? iconData;
  final Color? color;
  final VoidCallback onPressed;

  const SocialMediaButton({
    super.key,
    this.imagePath,
    this.iconData,
    this.color = Colors.transparent,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 70, // Adjust the size as needed
          height: 60, // Adjust the size as needed
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: imagePath != null
                ? Image.asset(
                    imagePath!,
                    width: 40, // Adjust the size as needed
                    height: 40, // Adjust the size as needed
                  )
                : Icon(
                    iconData,
                    size: 30, // Adjust the size as needed
                    color: Colors.green,
                  ),
          ),
        ),
      ),
    );
  }
}
