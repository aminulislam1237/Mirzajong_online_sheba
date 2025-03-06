import 'package:flutter/material.dart';

class AutoScrollingText extends StatefulWidget {
  final String text;
  final double textSize;
  final double speed;
  final Color backgroundColor;

  const AutoScrollingText({
    super.key,
    required this.text,
    this.textSize = 16.0,
    this.speed = 1.0,
    this.backgroundColor = Colors.redAccent,
  });

  @override
  State<AutoScrollingText> createState() => _AutoScrollingTextState();
}

class _AutoScrollingTextState extends State<AutoScrollingText> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startScrolling();
  }

  void _startScrolling() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 16)); // Approximately 60 FPS
      if (_scrollController.hasClients) {
        if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 1000), // Instantly reset
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            _scrollController.offset + widget.speed,
            duration: const Duration(milliseconds: 16),
            curve: Curves.linear,
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Container(
        color: widget.backgroundColor, // Use the backgroundColor property
        child: ListView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          children: [
            Text(
              List.generate(100, (index) => widget.text).join('  '),
              style: TextStyle(fontSize: widget.textSize),
            ),
          ],
        ),
      ),
    );
  }
}
