import 'package:flutter/material.dart';
import 'package:smart_movie/view/onbarding_screen.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Trigger navigation after a 2-second delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OnboardingScreen(), // Replace with your login page
        ),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // Gradient background
          gradient: LinearGradient(
            colors: [
              Colors.blue, // Start color
              Colors.purple, // End color
            ],
            begin: Alignment.topCenter, // Gradient starts at the top
            end: Alignment.bottomCenter, // Gradient ends at the bottom
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png', // Path to your logo image
                height: 150,
              ),
              const SizedBox(height: 50),
              // Add more widgets here if needed
            ],
          ),
        ),
      ),
    );
  }
}
