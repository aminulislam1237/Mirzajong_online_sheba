import 'package:flutter/material.dart';

class AddInfoScreen extends StatelessWidget {
  const AddInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter your name'),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            Text('Enter your email'),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Save the entered information to Firestore or Firebase Realtime Database
                // Example: Firestore.instance.collection('users').document().set({
                //   'name': _nameController.text,
                //   'email': _emailController.text,
                // });
                // Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
