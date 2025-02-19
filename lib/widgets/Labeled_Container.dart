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


  const LabeledContainer({
    Key? key,
    required this.icon,
    required this.text,
    this.width = 100, // Default width
    this.height = 100, // Default height
    this.backgroundColor = Colors.greenAccent, // Default background color
    this.borderRadius = const BorderRadius.all(Radius.circular(16)), // Default border radius
    this.textStyle = const TextStyle(color: Colors.black45, fontWeight: FontWeight.bold), // Customize text style
    this.padding = const EdgeInsets.all(8),

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        width: width,
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 10),
            Text(text, style: textStyle),
          ],
        ),
      ),
    );
  }
}


