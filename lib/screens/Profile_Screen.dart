import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _profileScaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _profileScaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _profileScaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _profileScaleAnimation.value,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/profile.jpg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 3,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: const Text(
                  'মোঃ আমিনুল ইসলাম রাসেল',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 800),
                child: const Text(
                  'ফাউন্ডার & ডেভেলপার',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
              const SizedBox(height: 20),
              FadeInUp(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 800),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      'প্রিয় মির্জাগঞ্জ উপজেলা বাসি আসসালামু আলাইকুম, আমি পটুয়াখালী জেলার মির্জাগঞ্জ উপজেলার ৪ নং দেউলী সুবিদখালী ইউনিয়নের '
                          'পূর্ব সুবিদখালী গ্রামের সন্তান। আমি ড্যাফোডিল ইন্টারন্যাশনাল ইউনিভার্সিটি তে সফটওয়্যার ইঞ্জিনিয়ারিং বিভাগে অধ্যায়নরত আছি,'
                          ' আমি কিছু সময় ধরে মোবাইল অ্যাপ ডেভেলপিং উপর কাজ করে যাচ্ছি। তারই ধারাবাহিকতায় প্রিয় মির্জাগঞ্জ উপজেলাবাসীর  জীবনযাত্রার'
                          ' মান সহজ ও উন্নতি করার লক্ষ্যে প্রয়োজনীয় সকল তথ্য একসাথে পেতে আমি তৈরি করেছি মির্জাগঞ্জ তথ্য সেবা নামের একটি মোবাইল এপ্লিকেশন। '
                          'মির্জাগঞ্জ তথ্য সেবা অ্যাপটি স্বাস্থ্য সেবা, নাগরিক সেবা, শিক্ষার প্রসার, ব্যবসা-বাণিজ্যের প্রসার, বেকারত্ব দূরীকরণ ও জীবন মান উন্নয়নে বিভিন্ন '
                          'সেক্টরে ভূমিকা পালন করবে বলে আমি আশাবাদী। আপনাদের সবার জন্য দোয়া ও শুভকামনা।',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialMediaButton(
                    imagePath: 'assets/icon/facebook.png',
                    onPressed: () => _launchSocialMediaRasel('Facebook'),
                  ),
                  SocialMediaButton(
                    imagePath: 'assets/icon/messengericon.png',
                    onPressed: () => _launchSocialMediaRasel('messenger'),
                  ),
                  SocialMediaButton(
                    imagePath: 'assets/icon/gmailicon.png',
                    onPressed: () => _launchSocialMediaRasel('gmail'),
                  ),
                  SocialMediaButton(
                    imagePath: 'assets/icon/call.png',
                    onPressed: () => _launchSocialMediaRasel('call'),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              AnimatedBuilder(
                animation: _profileScaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _profileScaleAnimation.value,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/rumi.jpg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 3,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: const Text(
                  'মোঃ খালিদ হাসান রুমি',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 800),
                child: const Text(
                  'তথ্যদাতা',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialMediaButton(
                    imagePath: 'assets/icon/facebook.png',
                    onPressed: () => _launchSocialMediaRumi('Facebook'),
                  ),
                  SocialMediaButton(
                    imagePath: 'assets/icon/messengericon.png',
                    onPressed: () => _launchSocialMediaRumi('messenger'),
                  ),
                  SocialMediaButton(
                    imagePath: 'assets/icon/gmailicon.png',
                    onPressed: () => _launchSocialMediaRumi('gmail'),
                  ),
                  SocialMediaButton(
                    imagePath: 'assets/icon/call.png',
                    onPressed: () => _makePhoneCall('call'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _launchSocialMediaRasel(String platform) async {
    String url = '';
    if (platform == 'Facebook') {
      url = "https://www.facebook.com/aminul.islam.Rasel34/";
    } else if (platform == 'messenger') {
      url = "https://m.me/aminul.islam.Rasel34/";
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

  void _launchSocialMediaRumi(String platform) async {
    String url = '';
    if (platform == 'Facebook') {
      url = "https://www.facebook.com/khalidhasanrumi.bd";
    } else if (platform == 'messenger') {
      url = "https://m.me/khalidhasanrumi.bd";
    } else if (platform == 'gmail') {
      url = "mailto:aminul.islam20025@gmail.com";
    } else if (platform == 'call') {
      url = "tel:+8801607316569";
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
          width: 60, // Adjusted size
          height: 60, // Adjusted size
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.1), // Light background for buttons
            borderRadius: BorderRadius.circular(30), // Circular buttons
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
              width: 35, // Adjusted size
              height: 35, // Adjusted size
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
