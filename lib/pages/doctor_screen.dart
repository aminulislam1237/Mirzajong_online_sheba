import 'package:flutter/material.dart';

class DoctorInfoScreen extends StatelessWidget {
  DoctorInfoScreen({super.key});

  final List<Map<String, String>> doctors = [
    {
      'name': 'শামসুল ইসলাম সোহেল',
      'specialty': 'এমবিবিএস ডাক্তার',
      'address': 'মির্জাগঞ্জ, পটুয়াখালী',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'উমর ফারুক জাবির',
      'specialty': 'এমবিবিএস ডাক্তার',
      'address': 'মির্জাগঞ্জ, পটুয়াখালী',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'অংকন আক্তার',
      'specialty': 'এমবিবিএস ডাক্তার',
      'address': 'মির্জাগঞ্জ, পটুয়াখালী',
      'image': 'assets/icon/woman.png'
    },
    {
      'name': 'মো: হাসান জামান',
      'specialty': 'এমবিবিএস ডাক্তার',
      'address': 'মির্জাগঞ্জ, পটুয়াখালী',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'মাসুদুর রহমান',
      'specialty': 'এমবিবিএস ডাক্তার',
      'address': 'মির্জাগঞ্জজ, পটুয়াখালী',
      'image': 'assets/icon/man.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ডাক্তারদের তথ্য'), // Changed title to Bengali
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return DoctorCard(
            name: doctor['name']!,
            specialty: doctor['specialty']!,
            address: doctor['address']!,
            image: doctor['image']!,
          );
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String address;
  final String image;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.address,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // Added text alignment
              ),
              const SizedBox(height: 8),
              Text(specialty,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center // Added text alignment
                  ),
              const SizedBox(height: 8),
              Text(address,
                  style: const TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center // Added text alignment
                  ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
