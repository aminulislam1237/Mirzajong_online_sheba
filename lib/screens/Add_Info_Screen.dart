import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String message = _messageController.text;



      _nameController.clear();
      _emailController.clear();
      _messageController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ডেটা জমা দেওয়া হয়েছে!')),
      );
    }
  }

  void _openFacebookPage() async {
    const facebookUrl = "https://www.facebook.com/aminul.islam.Rasel34"; // Replace with your Facebook Page ID
    final Uri url = Uri.parse(facebookUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ফেসবুক পেজ খুলতে পারা যায়নি।')),
      );
    }
  }

  void _openMessenger() async {
    const messengerUrl = "https://m.me/khalidhasanrumi.bd"; // Replace with your Messenger username
    final Uri url = Uri.parse(messengerUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('মেসেঞ্জার খুলতে পারা যায়নি।')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.lightGreenAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              color: Colors.greenAccent[100],
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'যোগাযোগ করুন',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'নাম',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'অনুগ্রহ করে আপনার নাম লিখুন';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'ইমেইল',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'অনুগ্রহ করে আপনার ইমেইল লিখুন';
                          }
                          if (!value.contains('@')) {
                            return 'অনুগ্রহ করে একটি সঠিক ইমেইল লিখুন';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(  // Corrected: Added _messageController here
                        controller: _messageController,
                        decoration: InputDecoration(
                          labelText: 'বার্তা',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'অনুগ্রহ করে একটি বার্তা লিখুন';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _submitData,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text('জমা দিন'),
                      ),


                      const SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: _openFacebookPage,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                textStyle: const TextStyle(fontSize: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text('ফেসবুক পেজ'),
                            ),
                          ),
                          const SizedBox(width: 8),

                          SizedBox(
                            width: 148.5,
                            child: ElevatedButton(
                              onPressed: _openMessenger,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                textStyle: const TextStyle(fontSize: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text('মেসেঞ্জার'),
                            ),
                          ),
                        ],
                      ),
                    ],

                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}