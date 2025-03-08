import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        _buildCarouselItem("assets/carrousel banner/Photo1.jpg",
            "মজিদবাড়িয়া শাহী মসজিদ", ""),
        _buildCarouselItem(
            "assets/carrousel banner/Photo2.jpg", "মির্জাগন্ঞ্জ মাজার", ""),
        _buildCarouselItem(
            "assets/carrousel banner/Photo3.jpg", "মির্জাগন্ঞ্জ মাজার", ""),
        _buildCarouselItem("assets/carrousel banner/Photo4.jpg",
            "রানীপুর মিয়া বাড়ি মসজিদ", ""),
        _buildCarouselItem("assets/carrousel banner/photo.jpg",
            "সুবিদখালী সরকারি র.ই পাইলট মাধ্যমিক বিদ্যালয়", ""),
        _buildCarouselItem(
            "assets/carrousel banner/Photo6.jpg", "পায়রা কুঞ্জ লঞ্চঘাট", ""),
        _buildCarouselItem(
            "assets/carrousel banner/Photot7.jpg", "শ্রীমন্ত নদী", ""),
      ],
      options: CarouselOptions(
        height: 250, // Increased height
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.easeInOut, // Smooth animation
        autoPlayAnimationDuration:
            const Duration(milliseconds: 800), // Adjust duration
        pauseAutoPlayOnTouch: true, // Pause on hover
        viewportFraction: 0.8, // Adjust viewport fraction
        aspectRatio: 16 / 9, // Maintain aspect ratio
        enableInfiniteScroll: true, // Enable infinite scroll
        initialPage: 0, // Start from the first image
        reverse: false, // Scroll in normal direction
        scrollDirection: Axis.horizontal, // Scroll horizontally
      ),
    );
  }

  Widget _buildCarouselItem(
      String imagePath, String title, String description) {
    return Builder(
      // Use Builder to get context within the item
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Rounded corners
            boxShadow: const [
              // Add shadow
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                // Clip image to rounded corners
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 250, // Match CarouselSlider height
                ),
              ),
              Positioned(
                // Caption overlay
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color:
                        Colors.black.withOpacity(0.5), // Semi-transparent black
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
