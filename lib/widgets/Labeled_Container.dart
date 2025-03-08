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
    this.width = 80, // Decreased width
    this.height = 80, // Decreased height
    this.backgroundColor = Colors.greenAccent, // Default background color
    this.borderRadius =
    const BorderRadius.all(Radius.circular(15)), // Slightly less rounded corners
    this.textStyle = const TextStyle(
      color: Colors.black54, // More visible text
      fontWeight: FontWeight.w500, // Slightly less bold
    ),
    this.padding = const EdgeInsets.all(4.0), // Decreased padding
    this.gradient,
    this.boxShadow = const BoxShadow(
      // Default boxShadow
      color: Colors.black26,
      blurRadius: 6, // Reduced blur radius
      offset: Offset(0, 2), // Reduced offset
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
          color: backgroundColor, // Use the backgroundColor property
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24, // Decreased icon size
              color: Colors.black54,
            ),
            const SizedBox(height: 4), // Decreased space
            Text(
              text,
              style: textStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis, // Prevent overflow
            ),
          ],
        ),
      ),
    );
  }
}
