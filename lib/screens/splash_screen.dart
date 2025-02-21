import 'dart:async';
import 'package:flutter/material.dart';
import 'package:musf_app1/screens/Home_screen_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreenState()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/profile.jpg", // Replace with your logo image
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              "মির্জাগঞ্জ তথ্য সেবা",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 30),

            /// Animated Circular Progress Indicator
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 6.3, // 2 * pi for full rotation
                  child: child,
                );
              },
              child: SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 6,
                  backgroundColor: Colors.teal.withOpacity(0.3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
