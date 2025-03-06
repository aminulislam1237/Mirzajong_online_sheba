import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height * 0.2;

    return Flexible(
      child: SizedBox(
        height: cardHeight,
        child: InkWell(
          onTap: onTap,
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    height: cardHeight * 0.5,
                  ),
                ),
                Center(child: Text(title)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
