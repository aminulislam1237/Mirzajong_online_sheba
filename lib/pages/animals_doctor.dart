import 'package:flutter/material.dart';

class AnimalDoctorInfoScreen extends StatelessWidget {
  AnimalDoctorInfoScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. John Doe',
      'specialty': 'Cardiologist',
      'address': '123 Main St, New York, NY',
      'image': 'assets/icon/man.png'
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal Doctors Information'),
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
    Key? key,
    required this.name,
    required this.specialty,
    required this.address,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(specialty, style: const TextStyle(fontSize: 18, color: Colors.grey)),
              const SizedBox(height: 8),
              Text(address, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
