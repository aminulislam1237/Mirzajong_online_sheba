import 'package:flutter/material.dart';
import '../widgets/Grid_Card_Widget.dart';
import '../widgets/carosel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold( //Remove if you are using a parent scaffold.
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Important: Keep this!
            children: [
              CarouselSliderWidget(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: GridCardWidget(// Add this!
                ),
              ),
               // Add bottom padding here
            ],
          ),
        ),
      ),
    );
  }
}