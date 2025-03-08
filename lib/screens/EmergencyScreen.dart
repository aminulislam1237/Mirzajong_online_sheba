import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:musf_app1/Icon%20Page/police_screen.dart';
import 'package:musf_app1/Icon%20Page/wifiLine_screen.dart';
import 'package:musf_app1/pages/Health_information_screen.dart';
import 'package:musf_app1/pages/contact.dart';

import '../pages/ambulence_service.dart';

class Emergencyscreen extends StatelessWidget {
  const Emergencyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GifView.asset(
                'assets/icons8-commercial.gif',
                height: 100,
                width: 200,
                frameRate: 30,
              ),
              const SizedBox(height: 20),
              const Text(
                'জরুরী প্রয়োজনে যোগাযোগ করুন',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              _buildRow(context, [
                _buildCardData(
                  "assets/icon/police.png",
                  'পুলিশ স্টেশন',
                  () => const PoliceScreen(),
                ),
                _buildCardData(
                  "assets/icon/fire.png",
                  'ফায়ার সার্ভিস',
                  () => const ContactScreen(),
                ),
              ]),
              const SizedBox(height: 16),
              _buildRow(context, [
                _buildCardData(
                  "assets/icon/ambulence.png",
                  'অ্যাম্বুলেন্স সার্ভিস',
                  () => const AmbulenceServiceScreen(),
                ),
                _buildCardData(
                  "assets/icon/wifi.png",
                  'ওয়াইফাই সার্ভিস',
                  () => const WifiLineScreen(),
                ),
                // Add an empty card to maintain alignment if needed
              ]),
              const SizedBox(height: 16),
              _buildRow(context, [
                _buildCardData(
                  "assets/icon/hospital.png",
                  'স্বাস্থ্যসেবা',
                  () => const HealthInformationScreen(),
                ),
                // Add an empty card to maintain alignment if needed
              ]),
              const SizedBox(height: 80),
              // Add more content or widgets here as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, List<_CardData> cardDataList) {
    return Row(
      children: cardDataList
          .map((cardData) => Expanded(child: _buildCard(context, cardData)))
          .toList(),
    );
  }

  Widget _buildCard(BuildContext context, _CardData cardData) {
    double cardHeight = MediaQuery.of(context).size.height * 0.2;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: cardHeight,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => cardData.pageBuilder()),
            );
          },
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    cardData.imagePath,
                    fit: BoxFit.contain,
                    height: cardHeight * 0.4,
                  ),
                ),
                Text(
                  cardData.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _CardData _buildCardData(
      String imagePath, String title, Widget Function() pageBuilder) {
    return _CardData(imagePath, title, pageBuilder);
  }
}

class _CardData {
  final String imagePath;
  final String title;
  final Widget Function() pageBuilder;

  _CardData(this.imagePath, this.title, this.pageBuilder);
}
