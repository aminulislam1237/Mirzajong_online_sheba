import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('This is the More screen.'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Settings screen
                //Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              child: Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
