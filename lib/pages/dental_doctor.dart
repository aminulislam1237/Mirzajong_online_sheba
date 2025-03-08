import 'package:flutter/material.dart';

class AnimalDoctorInfoScreen extends StatelessWidget {
  AnimalDoctorInfoScreen({super.key});

  final List<Map<String, String>> doctors = [
    {
      'name': 'জান্নাতি ডেন্টাল কেয়ার',
      'address': 'সুবিদখালী বাজার ',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'ডক্টরস ডেন্টাল সার্জারী',
      'address': 'নান্নু শপিং কমপ্লেক্স, সুবিদখালী',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'ফেমাস ডেন্টাল কেয়ার',
      'address': 'সুবিদখালী বাজার ',
      'image': 'assets/icon/man.png'
    },
    {
      'name': 'পলকী ডেন্টাল কেয়ার',
      'address': 'সুবিদখালী বাজার ',
      'image': 'assets/icon/man.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ডেন্টাল ডাক্তার'),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return DoctorCard(
            name: doctor['name']!,
            address: doctor['address']!,
          );
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String address;

  const DoctorCard({
    super.key,
    required this.name,
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
              const Icon(Icons.local_hospital_sharp),
              const SizedBox(height: 16),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('ঠিকানা:  $address', style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
