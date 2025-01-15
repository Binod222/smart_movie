import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_movie/features/onboarding/presentation/view_model/onboarding/onboarding_cubit.dart';
import 'package:smart_movie/features/onboarding/presentation/view_model/onboarding/onboarding_state.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            final onboardingCubit = context.read<OnboardingCubit>();
            return Stack(
              children: [
                PageView(
                  onPageChanged: (index) {
                    onboardingCubit.updatePage(index);
                  },
                  children: [
                    _buildOnboardingPage(
                      image: 'assets/images/onboarding1.png',
                      title: 'Welcome to SmartMovie',
                      description: 'Explore and enjoy your favorite movies!',
                    ),
                    _buildOnboardingPage(
                      image: 'assets/images/onboarding2.png',
                      title: 'Stay Updated',
                      description: 'Get notifications about new releases.',
                    ),
                    _buildOnboardingPage(
                      image: 'assets/images/onboarding3.png',
                      title: 'Personalized Recommendations',
                      description: 'Find content tailored just for you.',
                    ),
                  ],
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          onboardingCubit.skipOnboarding();
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      state.currentPage == 2
                          ? ElevatedButton(
                              onPressed: () {
                                onboardingCubit.finishOnboarding();
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              child: const Text('Get Started'),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                onboardingCubit
                                    .updatePage(state.currentPage + 1);
                              },
                              child: const Text('Next'),
                            ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue, // Start color
            Colors.purple, // End color
          ],
          begin: Alignment.topCenter, // Gradient starts at the top
          end: Alignment.bottomCenter, // Gradient ends at the bottom
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 250),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
