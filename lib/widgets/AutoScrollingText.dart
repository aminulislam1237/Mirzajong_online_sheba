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
      height: 40, // Adjusted height for better visibility
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.greenAccent, Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              child: const Row(
                children: [
                  Icon(Icons.notifications, color: Colors.white), // Notification icon
                  SizedBox(width: 4.0), // Spacing between icon and text
                  Text(
                    "নোটিশ:",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white, // Adjusted text color
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  Text(
                    List.generate(100, (index) => widget.text).join('             '),
                    style: TextStyle(
                      fontSize: widget.textSize,
                      color: Colors.black54,
                      shadows: const [
                        Shadow(
                          blurRadius: 2.0,
                          color: Colors.black26,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    ),
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
