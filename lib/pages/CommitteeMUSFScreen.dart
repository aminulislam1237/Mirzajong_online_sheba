import 'package:flutter/material.dart';

class CommitteeMember {
  final String name;
  final String position;
  final String imageUrl;

  CommitteeMember({
    required this.name,
    required this.position,
    required this.imageUrl,
  });
}

class CommitteeMUSFScreen extends StatelessWidget {
  final List<CommitteeMember> committeeMembers = [
    CommitteeMember(
      name: "Md. Mehedi Hasan",
      position: "সভাপতি",
      imageUrl: "URL_TO_PRESIDENT_IMAGE", // Replace with actual URL
    ),
    CommitteeMember(
      name: "Md. soikot",
      position: "সাধারণ সম্পাদক",
      imageUrl: "URL_TO_SECRETARY_IMAGE", // Replace with actual URL
    ),
    // Add more members as needed
  ];

  CommitteeMUSFScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("মির্জাগন্ঞ্জ উপজেলা স্টুডেন্টস’ ফোরাম, ঢাকা"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column( // Changed from ListView to Column
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "২০১১ সালে রাজধানী ঢাকা'র বুকে আত্মপ্রকাশ করে শিক্ষার্থীদের সংগঠন “মির্জাগন্ঞ্জ উপজেলা স্টুডেন্টস’ ফোরাম, ঢাকা”। ঢাকায় শিক্ষারত মির্জাগন্ঞ্জ উপজেলার শিক্ষার্থীদের সার্বিক সহযোগিতা ও বিভিন্ন সামাজিক সমস্যা দূরীকরণে কাজ করে চলেছে সংগঠনটি। বর্তমানে মির্জাগন্ঞ্জ উপজেলার সীমানা পেড়িয়ে জাতীয় দূর্যোগে সাহায্যর হাত বাড়িয়ে দিয়েছে সংগঠনটি। প্রতিবছর বিভিন্ন সামাজিক ও শিক্ষামূলক কাজ চালিয়ে যাওয়ার মাধ্যমে বর্তমানে মির্জাগন্ঞ্জ উপজেলার জনপ্রিয় ও সর্ববৃহৎ অরাজনৈতিক ছাত্র সংগঠনে পরিনত হয়েছে “মির্জাগন্ঞ্জ উপজেলা স্টুডেন্টস’ ফোরাম, ঢাকা”",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ),
          Expanded( // Added Expanded to make the ListView.builder scrollable
            child: ListView.builder(
              itemCount: committeeMembers.length,
              itemBuilder: (context, index) {
                final member = committeeMembers[index];
                return CommitteeMemberCard(member: member);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CommitteeMemberCard extends StatelessWidget {
  final CommitteeMember member;

  const CommitteeMemberCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(member.imageUrl),
              backgroundColor: Colors.grey.shade300,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    member.position,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
