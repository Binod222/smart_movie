import 'package:flutter/material.dart';
import 'package:smart_movie/screen/Splash_Screen_page.dart';

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
      home: SplashScreenPage(), // Set HomePage as the initial page
    );
  }
}
