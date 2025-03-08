import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DishScreen extends StatelessWidget {
  const DishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ডিশ সার্ভিস",
          style: GoogleFonts.notoSansBengali(),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "সিয়াম ক্যাবল নেটওয়ার্ক",
                        style: GoogleFonts.notoSansBengali(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        leading: const Icon(Icons.phone, color: Colors.green),
                        title: Text(
                          "০১৭১৪-২৩৪২২৫",
                          style: GoogleFonts.notoSansBengali(),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on, color: Colors.green),
                        title: Text(
                          "মির্জাগঞ্জ, পটুয়াখালী, বাংলাদেশ",
                          style: GoogleFonts.notoSansBengali(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Phone Button
          ],
        ),
      ),
    );
  }
}
