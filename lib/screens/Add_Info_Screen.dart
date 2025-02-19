import 'package:flutter/material.dart';

class AddInfoScreen extends StatefulWidget {
  const AddInfoScreen({super.key});

  @override
  State<AddInfoScreen> createState() => _AddInfoScreenState();
}

class _AddInfoScreenState extends State<AddInfoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityAnimation.value,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container( // Wrap with Container for background
                decoration: const BoxDecoration(
                  gradient: LinearGradient( // Add a gradient
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.greenAccent, Colors.lightGreenAccent],
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 48), // Increased top spacing
                        _buildTextField( // Reusable TextField widget
                          controller: _nameController,
                          labelText: 'Name',
                          icon: Icons.person, // Add an icon
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            // ... your submit logic ...
                          },
                          style: ElevatedButton.styleFrom( // Customize button
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Submit',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white), // White label color
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.white), // White icon
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.white), // White label text
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white), // White border
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white), // White focused border
            ),
          ),
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white), // White text color
          cursorColor: Colors.white, // White cursor
        ),
      ],
    );
  }
}