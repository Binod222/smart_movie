import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_movie/features/auth/presentation/view/login_screen.dart';

void main() {
  group('Login Form Tests', () {
    testWidgets('Login form has Email and Password fields', (tester) async {
      // Build the LoginView widget
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(),
        ),
      );

      // Verify that the form contains the Email and Password fields
      expect(find.byType(TextFormField),
          findsNWidgets(2)); // Two fields: Email & Password
    });

    testWidgets('Login button displays validation errors for empty fields',
        (tester) async {
      // Build the LoginView widget
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(),
        ),
      );

      // Tap the login button without entering any text
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(); // Wait for the form to validate

      // Verify that validation error messages are shown
      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('Login form works with valid input', (tester) async {
      // Build the LoginView widget
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(),
        ),
      );

      // Enter valid email and password
      await tester.enterText(
          find.byType(TextFormField).at(0), 'binod@gmail.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');

      // Tap the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(); // Wait for the form to validate

      // Verify that no validation errors are shown
      expect(find.text('Email is required'), findsNothing);
      expect(find.text('Password is required'), findsNothing);
    });
  });
}
