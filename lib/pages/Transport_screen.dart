import 'package:flutter/material.dart';
import 'package:musf_app1/pages/Rent_car_screen.dart';

import 'Bus_service.dart';

class TransportService extends StatelessWidget {
  const TransportService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('পরিবহন সেবা'),
        backgroundColor: Colors.greenAccent, // Example app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Enables scrolling if content overflows
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const SizedBox(height: 20),
              _buildRow(context, [
                _buildCardData(
                    "assets/icon/car.png", 'রেন্ট-এ-কার',
                        () => const RentCarScreen()),
                _buildCardData("assets/icon/sbs.jpg", 'বাস সার্ভিস',
                        () => const BuserviceService()),
              ]),
              const SizedBox(height: 16),
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
      padding: const EdgeInsets.all(8.0), // Add padding around cards
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
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    cardData.imagePath,
                    fit: BoxFit.contain,
                    height: cardHeight * 0.4, // Adjusted image size
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
