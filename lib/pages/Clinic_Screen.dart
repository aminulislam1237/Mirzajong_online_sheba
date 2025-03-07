import 'package:flutter/material.dart';

class ClinicScreen extends StatelessWidget {
  const ClinicScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> clinicData = const [
    {
      "name": "মক্কা ক্লিনিক",
      "address": "ঠিকানা: মহিলা কলেজ রোড, সুবিদখালী",
    },
    {
      "name": "শাহজাহান জেনারেল হাসপাতাল",
      "address": "ঠিকানা: সুবিদখালী বাস স্টান্ড",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ক্লিনিক তথ্য',),
        backgroundColor: Colors.greenAccent,
        elevation: 5,
        shadowColor: Colors.black45,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: clinicData.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.local_hospital, color: Colors.redAccent),
                title: Text(
                  clinicData[index]['name'] ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  clinicData[index]['address'] ?? '',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
