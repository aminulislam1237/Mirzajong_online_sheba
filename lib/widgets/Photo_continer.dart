import 'package:flutter/material.dart';

class PhotoWithCaption extends StatelessWidget {
  final String imagePath;
  final String caption;

  const PhotoWithCaption({
    super.key,
    required this.imagePath,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container with Image
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10), // Spacing between image and caption

        // Caption
        Text(
          caption,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}