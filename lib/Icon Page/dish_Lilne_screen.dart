import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DishScreen extends StatelessWidget {
  const DishScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ডিশ সার্ভিস"),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Banner Image

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "সিয়াম ক্যাবল নেটওয়ার্ক",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.green),
                        title: Text("01714-234225"),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.green),
                        title: Text("Mirzajong, Patuakhali, Bangladesh"),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Phone Button
          ],
        ),
      ),
    );
  }
}
