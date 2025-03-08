import 'package:flutter/material.dart';
import 'Clinic_Screen.dart';
import 'Diagnostic_Screen.dart';
import 'HomopothayDoctor_screen.dart';
import 'ambulence_service.dart';
import 'dental_doctor.dart';
import 'doctor_screen.dart';

class HealthInformationScreen extends StatelessWidget {
  const HealthInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('স্বাস্থ্যসেবা'),
        backgroundColor: Colors.greenAccent, // Example app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Enables scrolling if content overflows
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _buildRow(context, [
                _buildCardData(
                    "assets/icon/clinic.png", 'ক্লিনিক', () => const ClinicScreen()),
                _buildCardData("assets/icon/diagonitis.png", 'ডায়াগনস্টিক ',
                    () => const DiagnosticScreen()),
                _buildCardData("assets/icon/doctor.png", 'ডাক্তার',
                    () => DoctorInfoScreen()),
              ]),
              const SizedBox(height: 16),
              _buildRow(context, [
                _buildCardData("assets/icon/animal doctor.png", 'ডেন্টাল ডাক্তার',
                    () => AnimalDoctorInfoScreen()),
                _buildCardData("assets/icon/homopothic.png",
                    'হোমোপ্যাথি ডাক্তার', () => HomoDoctorInfoScreen()),
                _buildCardData("assets/icon/ambulence.png",
                    'এম্বুলেন্স সার্ভিস', () => const AmbulenceServiceScreen()),
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
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center content vertically
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
