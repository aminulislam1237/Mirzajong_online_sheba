import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/AutoScrollingText.dart';
import '../widgets/Grid_Card_Widget.dart';
import '../widgets/carosel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference fetchData =
      FirebaseFirestore.instance.collection("Notice");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CarouselSliderWidget(),
              const SizedBox(height: 16),
              StreamBuilder(
                stream: fetchData.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final documents = snapshot.data!.docs;
                    final noticeText = documents.isNotEmpty
                        ? documents[0]['Notice']
                        : 'No notice available';

                    return AutoScrollingText(
                      text: noticeText,
                      textSize: 18.0,
                      speed: 5.0, // Adjust the scrolling speed
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 50.0),
                child: GridCardWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
