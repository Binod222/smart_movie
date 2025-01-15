import 'package:flutter/material.dart';
import 'package:smart_movie/core/theme/app_theme.dart';
import 'package:smart_movie/features/auth/presentation/views/login_screen.dart';
import 'package:smart_movie/features/auth/presentation/views/registration_screen.dart';
import 'package:smart_movie/features/dashboard/presentation/widgets/bottom_navigation_bar.dart';
import 'package:smart_movie/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:smart_movie/features/splashscreen/presentation/views/splash_screen.dart';
// Your Splash Screen

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Fixed constructor syntax

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set initial route to SplashScreen
      theme: getApplicationTheme(),
      routes: {
        '/': (context) =>
            const SplashScreenPage(), // Splash screen as initial route
        '/onboarding1': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginPage(), // Route to Login Page
        '/signup': (context) => SignUpPage(), // Route to Sign Up Page
        '/home': (context) =>
            const BottomNavigationView(), // Route to Sign Up Page
      },
    );
  }
}
