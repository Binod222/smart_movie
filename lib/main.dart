import 'package:flutter/material.dart';
import 'package:smart_movie/view/Splash_Screen_page.dart'; // Your Splash Screen
import 'package:smart_movie/view/login_view.dart'; // Your login page
import 'package:smart_movie/view/registration_view.dart'; //Your Sign-Up page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Movie Recommendation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set initial route to SplashScreen
      routes: {
        '/': (context) => SplashScreenPage(), // Splash screen as initial route
        '/login': (context) => LoginPage(), // Route to Login Page
        '/signup': (context) => SignUpPage(), // Route to Sign Up Page
      },
    );
  }
}
