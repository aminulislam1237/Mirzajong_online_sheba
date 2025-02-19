import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset("assets/slide1.png", fit: BoxFit.fitWidth),
        Image.asset("assets/slide2.png", fit: BoxFit.fitHeight),
        Image.asset("assets/slide3.png", fit: BoxFit.fitWidth),
      ],
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
