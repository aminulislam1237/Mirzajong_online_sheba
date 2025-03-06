import 'package:flutter/material.dart';

class LabeledContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final Gradient? gradient;
  final BoxShadow? boxShadow; // Add boxShadow property

  const LabeledContainer({
    super.key,
    required this.icon,
    required this.text,
    this.width = 105, // Slightly increased width
    this.height = 105, // Slightly increased height
    this.backgroundColor = Colors.blueGrey, // Default is now white
    this.borderRadius = const BorderRadius.all(Radius.circular(25)), // More rounded corners
    this.textStyle = const TextStyle(
      color: Colors.black54, // More visible text
      fontWeight: FontWeight.w500, // Slightly less bold
    ),
    this.padding = const EdgeInsets.all(8.0),  // Increased padding
    this.gradient,
    this.boxShadow = const BoxShadow( // Default boxShadow
      color: Colors.black26,
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: gradient,
          color: Colors.greenAccent
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 36, // Increased icon size
              color: Colors.black54,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

}