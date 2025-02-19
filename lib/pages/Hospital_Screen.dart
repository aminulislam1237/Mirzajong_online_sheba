import 'package:flutter/material.dart';

class HospitalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This line handles the back navigation
          },
        ),
        title: Text('Hospital Screen'), // Optional: Add a title to your AppBar
      ),
      body: Center(child: Text('Welcome to the Hospital Screen')),
    );
  }
}
