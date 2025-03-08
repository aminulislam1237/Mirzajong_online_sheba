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
              padding: const EdgeInsets.all(16.0),
              child: GifView.asset(
                'assets/icons8-gmail-logo.gif',
                height: 150, // Adjusted height
                width: 150, // Adjusted width
                frameRate: 30,
              ),
            ),
            const Card(
              margin: EdgeInsets.all(16.0),
              elevation: 4, // Added elevation for depth
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)), // Rounded corners
              ),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal), // Enhanced text style
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1.0,
              indent: 20,
              endIndent: 20,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16, // Added spacing between buttons
              children: [
                SocialMediaButton(
                  imagePath: 'assets/icon/facebook.png',
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
                  onPressed: () => _makePhoneCall('call'),
                ),
              ],
            ),
            const SizedBox(height: 20), // Added spacing at the bottom
          ],
        ),
      ),
    );
  }

  void _launchSocialMedia(String platform) async {
    String url = '';
    if (platform == 'Facebook') {
      url = "https://www.facebook.com/share/1EPg4sj4Fe/";
    } else if (platform == 'messenger') {
      url = "https://m.me/608531172336824";
    } else if (platform == 'gmail') {
      url = "mailto:aminul.islam20025@gmail.com";
    }
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $platform';
    }
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '+8801838565702',
    );
    await launchUrl(launchUri);
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
          width: 70, // Adjusted size
          height: 70, // Adjusted size
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.1), // Light background for buttons
            borderRadius: BorderRadius.circular(35), // Circular buttons
            boxShadow: const [
               BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 2), // Shadow position
              ),
            ],
          ),
          child: Center(
            child: imagePath != null
                ? Image.asset(
              imagePath!,
              width: 40, // Adjusted size
              height: 40, // Adjusted size
            )
                : Icon(
              iconData,
              size: 29,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
