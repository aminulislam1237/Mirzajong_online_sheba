import 'package:flutter/material.dart';

class Emergencyscreen extends StatelessWidget {
  const Emergencyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Call 911 or use emergency services'),
            Text('Location: 123 Main St, City, State, ZIP'),
          ],
        ),
      ),
    );
  }
}
