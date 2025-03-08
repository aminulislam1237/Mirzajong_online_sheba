import 'package:flutter/material.dart';

class DiagnosticScreen extends StatelessWidget {
  const DiagnosticScreen({super.key});

  final List<Map<String, String>> clinicData = const [
    {
      "name": "সেবা ডায়াগনস্টিক সেন্টার",
      "address": "ঠিকানা: হাসপাতাল রোড, সুবিদখালী",
    },
    {
      "name": "মর্ডান ডায়াগনস্টিক সেন্টার",
      "address": "ঠিকানা: হাসপাতাল রোড, সুবিদখালী",
    },
    {
      "name": "ইউনাইটেড ডায়াগনস্টিক সেন্টার",
      "address": "ঠিকানা: উপজেলা পরিষদের সামনে, সুবিদখালী",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ডায়াগনস্টিক তথ্য',
        ),
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.local_hospital,
                  color: Colors.green,
                  size: 30,
                ),
                title: Text(
                  clinicData[index]['name'] ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  clinicData[index]['address'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
