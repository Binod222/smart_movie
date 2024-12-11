import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the login page

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      appBar: AppBar(
        title: Text('Smart Movie Recommendation'),
        backgroundColor: Colors.white, // AppBar background to black
        elevation: 0, // Remove shadow for a cleaner look
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png', // Path to your logo image
              height: 150,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Login Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
