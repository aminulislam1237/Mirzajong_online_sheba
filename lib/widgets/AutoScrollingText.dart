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
    this.backgroundColor = Colors.greenAccent,
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 16));
      if (_scrollController.hasClients) {
        if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent) {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 1000),
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
        color: widget.backgroundColor,
        child: Row(
          children: [
            Container(
              // Wrap the Text widget with a Container
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0), // Add padding for better appearance
              decoration: const BoxDecoration(
                // Add background color
                color: Colors.red,
              ),
              child: const Text(
                "নোটিশ:",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black54), // Adjust text color if needed
              ),
            ),
            Expanded(
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  Text(
                    List.generate(100, (index) => widget.text).join('             '),
                    style: TextStyle(fontSize: widget.textSize),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
