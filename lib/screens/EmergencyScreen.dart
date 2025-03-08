import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:musf_app1/Icon%20Page/police_screen.dart';
import 'package:musf_app1/Icon%20Page/wifiLine_screen.dart';
import 'package:musf_app1/pages/Health_information_screen.dart';
import '../pages/Fire_service.dart';
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
                height: 80, // Reduced height
                width: 160, // Reduced width
                frameRate: 30,
              ),
              const SizedBox(height: 20),
              const Text(
                'জাতীয় জরুরি সেবা নাম্বার ৯৯৯',
                style: TextStyle(
                  fontSize: 20, // Reduced font size
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
                  Colors.blueAccent,
                ),
                _buildCardData(
                  "assets/icon/fire.png",
                  'ফায়ার সার্ভিস',
                      () => FireServiceInfoScreen(),
                  Colors.orangeAccent,
                ),
              ]),
              const SizedBox(height: 16),
              _buildRow(context, [
                _buildCardData(
                  "assets/icon/ambulence.png",
                  'অ্যাম্বুলেন্স সার্ভিস',
                      () => const AmbulenceServiceScreen(),
                  Colors.greenAccent,
                ),
                _buildCardData(
                  "assets/icon/wifi.png",
                  'ওয়াইফাই সার্ভিস',
                      () => const WifiLineScreen(),
                  Colors.purpleAccent,
                ),
              ]),
              const SizedBox(height: 16),
              _buildRow(context, [
                _buildCardData(
                  "assets/icon/hospital.png",
                  'স্বাস্থ্যসেবা',
                      () => const HealthInformationScreen(),
                  Colors.redAccent,
                ),
              ]),
              const SizedBox(height: 80),
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
    double cardHeight = MediaQuery.of(context).size.height * 0.15; // Reduced height

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
            elevation: 6.0, // Adjusted elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Slightly smaller radius
            ),
            color: cardData.color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0), // Reduced padding
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Smaller radius
                    child: Image.asset(
                      cardData.imagePath,
                      fit: BoxFit.contain,
                      height: cardHeight * 0.4, // Adjusted image height
                    ),
                  ),
                ),
                Text(
                  cardData.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16, // Reduced font size
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _CardData _buildCardData(
      String imagePath, String title, Widget Function() pageBuilder, Color color) {
    return _CardData(imagePath, title, pageBuilder, color);
  }
}

class _CardData {
  final String imagePath;
  final String title;
  final Widget Function() pageBuilder;
  final Color color;

  _CardData(this.imagePath, this.title, this.pageBuilder, this.color);
}
