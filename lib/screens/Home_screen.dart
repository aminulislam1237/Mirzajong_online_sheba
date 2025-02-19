import 'package:flutter/material.dart';
import '../widgets/Grid_Card_Widget.dart';
import '../widgets/carosel_slider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body:  SingleChildScrollView(
        child: Column(
          children: [
            CarouselSliderWidget(),
            SizedBox(height: 20),
            GridCardWidget(),
          ],
        ),
      ),
    );
  }
}
