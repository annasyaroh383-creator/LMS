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
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Set status bar style to match background color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFB74141), // Terracotta color
        statusBarIconBrightness: Brightness.light,
      ),
    );

    // Fade in animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Navigate to login after 1 second
    _timer = Timer(const Duration(milliseconds: 1000), () {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        });
      }
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
      // Background color set to solid terracotta
      backgroundColor: const Color(0xFFB74141),
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 1),
        child: Center(
          // Center widget to center content horizontally and vertically
          child: Column(
            // MainAxisSize.min to make column wrap its children tightly
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo with book icon above CeLOE text
              Stack(
                alignment: Alignment.center,
                children: [
                  const Text(
                    'CeLOE',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.menu_book, // Open book icon
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Tagline text with specified styling
              const Text(
                'Learning Management System',
                style: TextStyle(
                  fontSize: 14, // Smaller font size
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  letterSpacing: 1.2, // Proportional letter spacing
                ),
                textAlign: TextAlign.center, // Center aligned
              ),
            ],
          ),
        ),
      ),
    );
  }
}
