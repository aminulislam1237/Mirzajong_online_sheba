import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musf_app1/screens/Home_screen_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeInOut,
    );

    _logoController.forward();
    _textController.forward();

    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreenState()),
      );
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Color(0xFF004D40)], // Cool green to dark gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: Tween<double>(begin: 0.8, end: 1.1).animate(
                  CurvedAnimation(
                    parent: _logoController,
                    curve: Curves.elasticOut,
                  ),
                ),
                child: SvgPicture.asset(
                  "assets/icon/logo.svg",
                  width: 200,
                  height: 200,
                  color: Colors.greenAccent, // Apply greenAccent color to SVG
                  placeholderBuilder: (context) => const CircularProgressIndicator(),
                ),
              ),
              const SizedBox(height: 20),

              FadeTransition(
                opacity: _fadeInAnimation,
                child: const Text(
                  "মির্জাগঞ্জ তথ্য সেবা",
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),

              RotationTransition(
                turns: _logoController,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation(Colors.greenAccent),
                    strokeWidth: 6,
                    backgroundColor: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
