import 'package:flutter/material.dart';
import '../widgets/Photo_continer.dart';

class HistoricalPleaceScreen extends StatelessWidget {
  const HistoricalPleaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("দর্শনীয় স্থান"),
        backgroundColor: Colors.greenAccent,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhotoWithCaption(
                  imagePath: 'assets/carrousel banner/Photo3.jpg',
                  caption: "মির্জাগঞ্জ হযরত ইয়ার উদ্দিন খলিফা দরবার শরীফ",
                  address: ' মির্জাগঞ্জ মাজার রোড',
                ),
                SizedBox(height: 20), // Spacing between widgets

                PhotoWithCaption(
                  imagePath: 'assets/carrousel banner/Photo1.jpg',
                  caption: "মজিদবাড়িয়া শাহী মসজিদ",
                  address: 'মজিদবাড়িয়া',
                ),
                PhotoWithCaption(
                  imagePath: 'assets/carrousel banner/Photo4.jpg',
                  caption: "রানীপুর মিয়া বাড়ি মসজিদ",
                  address: 'রানীপুর বাস স্টান্ড সংলগ্ন ',
                ),
                SizedBox(height: 20), // Spacing between widgets

                PhotoWithCaption(
                  imagePath: 'assets/carrousel banner/Image 8.jpg',
                  caption: "আশ্রাফ গ্রীন পার্ক",
                  address: 'সুবিদখালী - বেতাগী সড়ক সংলগ্ন,আমড়াগাছিয়া।',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
