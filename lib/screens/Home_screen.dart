import 'package:flutter/material.dart';
import '../widgets/Grid_Card_Widget.dart';
import '../widgets/carosel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: SafeArea( // Use SafeArea to avoid overlapping system UI
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CarouselSliderWidget(), // Keep const if the widget is truly constant
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: GridCardWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
