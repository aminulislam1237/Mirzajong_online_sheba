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
                  ' ফাউন্ডার & ডেভেলপার',
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
                    'প্রিয় মির্জাগঞ্জ উপজেলা বাসি আসসালামু আলাইকুম, আমি পটুয়াখালী জেলার মির্জাগঞ্জ উপজেলার ৪ নং দেউলী সুবিদখালী ইউনিয়নের পূর্ব সুবিদখালী গ্রামের সন্তান। আমি ড্যাফোডিল ইন্টারন্যাশনাল ইউনিভার্সিটি তে সফটওয়্যার ইঞ্জিনিয়ারিং বিভাগে অধ্যায়নরত আছি, আমি কিছু সময় ধরে মোবাইল অ্যাপ ডেভেলপিং উপর কাজ করে যাচ্ছি। তারই ধারাবাহিকতায় প্রিয় মির্জাগঞ্জ উপজেলাবাসীর  জীবনযাত্রার মান সহজ ও উন্নতি করার লক্ষ্যে প্রয়োজনীয় সকল তথ্য একসাথে পেতে আমি তৈরি করেছি মির্জাগঞ্জ তথ্য সেবা নামের একটি মোবাইল এপ্লিকেশন। মির্জাগঞ্জ তথ্য সেবা অ্যাপটি স্বাস্থ্য সেবা, নাগরিক সেবা, শিক্ষার প্রসার, ব্যবসা-বাণিজ্যের প্রসার, বেকারত্ব দূরীকরণ ও জীবন মান উন্নয়নে বিভিন্ন সেক্টরে ভূমিকা পালন করবে বলে আমি আশাবাদী। আপনাদের সবার জন্য দোয়া ও শুভকামনা।',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16,color: Colors.grey,),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ZoomIn(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 500),
                    child: IconButton(
                      icon: const Icon(Icons.facebook),
                      onPressed: () =>
                          _launchURL('https://www.facebook.com/aminul.islam.Rasel34'),
                    ),
                  ),
                  ZoomIn(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 500),
                    child: IconButton(
                      icon: const Icon(Icons.phone_android),
                      onPressed: () =>
                          _launchURL('https://wa.me/+8801838565702'),
                    ),
                  ),
                  ZoomIn(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(milliseconds: 500),
                    child: IconButton(
                      icon: const Icon(Icons.mail),
                      onPressed: () =>
                          _launchURL('mailto:aminul.islam200256@gmail.com'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
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
              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}