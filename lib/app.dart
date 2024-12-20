import 'package:flutter/material.dart';
import 'package:smart_movie/view/dashboard_view.dart';
import 'package:smart_movie/view/login_view.dart'; // Your login page
import 'package:smart_movie/view/onbarding_screen.dart';
import 'package:smart_movie/view/registration_view.dart'; // Your Sign-Up page
import 'package:smart_movie/view/splash_screen_page.dart'; // Your Splash Screen

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Fixed constructor syntax

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set initial route to SplashScreen
      routes: {
        '/': (context) =>
            const SplashScreenPage(), // Splash screen as initial route
        '/onboarding1': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginPage(), // Route to Login Page
        '/signup': (context) => const SignUpPage(), // Route to Sign Up Page
        '/home': (context) => const DashboardView(), // Route to Sign Up Page
      },
    );
  }
}
