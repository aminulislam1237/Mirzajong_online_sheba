import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("অ্যাপ সম্পর্কে"),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "আমাদের অ্যাপের উদ্দেশ্য",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "এই অ্যাপটি মির্জাগঞ্জ উপজেলার জনগনের জন্য তৈরি করা হয়েছে। আমাদের প্রধান উদ্দেশ্য হল সকল নাগরিককে তথ্য ও প্রযুক্তিগত সহায়তা প্রদান করা। এই অ্যাপের মাধ্যমে, আপনারা জরুরি সেবা, স্থানীয় তথ্য, কমিটি এবং অন্যান্য প্রয়োজনীয় পরিষেবা সম্পর্কে জানতে পারবেন।",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            const Text(
              "অ্যাপের বৈশিষ্ট্য",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "১. জরুরি সেবা: পুলিশ, ফায়ার সার্ভিস ও হাসপাতালের নম্বর এবং ঠিকানা।\n"
                  "২. স্থানীয় তথ্য: ইউনিয়ন পরিষদ, কমিটির তালিকা ও গুরুত্বপূর্ণ স্থানসমূহ।\n"
                  "৩. যোগাযোগ: স্থানীয় কর্মকর্তাদের সাথে সরাসরি যোগাযোগের সুযোগ।\n"
                  "৪. নিয়মিত আপডেট: নতুন তথ্য ও জরুরি বিজ্ঞপ্তি সম্পর্কে জানতে পারবেন।",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "যোগাযোগের ঠিকানা",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "আমাদের অফিসের ঠিকানা: মির্জাগঞ্জ, পটুয়াখালী।\n"
                  "ইমেইল: ai0011759@gmail.com\n"
                  "ফোন: 018338565702",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "ডেভেলপার",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "এই অ্যাপটি আমার নিজ দায়িত্বে তৈরি করা হয়েছে। আমরা স্থানীয় উন্নয়নে সহায়তা করতে বদ্ধপরিকর।",
              style: TextStyle(fontSize: 16,),
            ),

            const SizedBox(height: 20),
            const Text(
              "আমাদের লক্ষ্য",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "আমরা মির্জাগঞ্জ উপজেলাকে একটি উন্নত ও তথ্য-সমৃদ্ধ অঞ্চলে পরিণত করতে চাই। আপনাদের সহযোগিতা আমাদের একান্ত কাম্য।",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/icon/Logo[1].jpg', // Replace with your app logo asset path
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "© ২০২৫ মির্জাগঞ্জ উপজেলা তথ্য সেবা",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
