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
            "assets/carrousel banner/Photo2.jpg", "মির্জাগঞ্জ মাজার", ""),
        _buildCarouselItem(
            "assets/carrousel banner/Photo3.jpg", "মির্জাগঞ্জ মাজার", ""),
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
        pauseAutoPlayOnTouch: true, // Pause on touch
        viewportFraction: 0.85, // Adjust viewport fraction
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
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), // Rounded corners
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15), // Clip image
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 250, // Match CarouselSlider height
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Colors.black.withOpacity(0.6), // Semi-transparent
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20, // Increased font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (description.isNotEmpty) ...[
                        const SizedBox(height: 5),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14, // Description font size
                          ),
                        ),
                      ],
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
