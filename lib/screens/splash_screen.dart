import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    
    // Set status bar style to match background color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFB74747), // Maroon color
        statusBarIconBrightness: Brightness.light,
      ),
    );
    
    // Navigate to HomeScreen after 3 seconds
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color set to solid maroon
      backgroundColor: const Color(0xFFB74747),
      body: Center(
        // Center widget to center content horizontally and vertically
        child: Column(
          // MainAxisSize.min to make column wrap its children tightly
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo placeholder
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            // Tagline text with specified styling
            const Text(
              'Learning Management System',
              style: TextStyle(
                fontFamily: 'SansSerif', // Default sans serif font
                fontSize: 16, // Font size 16px
                fontWeight: FontWeight.w400, // Font weight 400
                color: Colors.white, // Pure white color
                letterSpacing: 0.5, // Slight letter spacing for modern look
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: const Color(0xFFB74747),
      ),
      body: const Center(
        child: Text('Welcome to Home Screen'),
      ),
    );
  }
}