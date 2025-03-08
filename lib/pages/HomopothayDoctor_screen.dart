import 'package:flutter/material.dart';

class HomoDoctorInfoScreen extends StatelessWidget {
  HomoDoctorInfoScreen({super.key});

  final List<Map<String, String>> doctors = [
    {
      'name': 'নেছারিয়া হোমিও হল',
      'specialty': 'হোমিও চিকিৎসক',
      'address': 'তিন রাস্তার মোড়, সুবিদখালী',
    },
    {
      'name': 'মাহাদী হোমিও চিকিৎসালয়',
      'specialty': 'হোমিও চিকিৎসক',
      'address': 'তিন রাস্তার মোড়, সুবিদখালী',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('হোমিও ডাক্তারদের তথ্য'), // Changed title to Bengali
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

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.address,
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
              const Icon(Icons.local_hospital_outlined),

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
              Text('ঠিকানা:  $address',
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
