import 'package:flutter/material.dart';

class ClinicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Clinic Screen'), // Added "Screen" for consistency
      ),
      body: Center(child: Text('Welcome to the Clinic Screen')),
    );
  }
}
