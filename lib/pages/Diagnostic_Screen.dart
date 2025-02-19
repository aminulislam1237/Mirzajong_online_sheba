import 'package:flutter/material.dart';

class DiagnosticScreen extends StatelessWidget {
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
        title: Text('Diagnostic Screen'), // Added "Screen" for consistency
      ),
      body: Center(child: Text('Welcome to the Diagnostic Screen')),
    );
  }
}