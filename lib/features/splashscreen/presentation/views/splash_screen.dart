import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_movie/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:smart_movie/features/splashscreen/presentation/view_model/splashscreen/splashscreen_cubit.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..navigateToNextScreen(),
      child: BlocListener<SplashCubit, bool>(
        listener: (context, state) {
          if (state) {
            // Navigate to the Onboarding Screen when state becomes true
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OnboardingScreen(),
              ),
            );
          }
        },
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue, // Start color
                  Colors.purple, // End color
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
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
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
