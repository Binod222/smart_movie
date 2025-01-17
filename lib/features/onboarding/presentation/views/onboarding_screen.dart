// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_movie/features/onboarding/presentation/view_model/onboarding/onboarding_cubit.dart';
// import 'package:smart_movie/features/onboarding/presentation/view_model/onboarding/onboarding_state.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => OnboardingCubit(),
//       child: Scaffold(
//         body: BlocBuilder<OnboardingCubit, OnboardingState>(
//           builder: (context, state) {
//             final onboardingCubit = context.read<OnboardingCubit>();
//             return Stack(
//               children: [
//                 PageView(
//                   onPageChanged: (index) {
//                     onboardingCubit.updatePage(index);
//                   },
//                   children: [
//                     _buildOnboardingPage(
//                       image: 'assets/images/onboarding1.png',
//                       title: 'Welcome to SmartMovie',
//                       description: 'Explore and enjoy your favorite movies!',
//                     ),
//                     _buildOnboardingPage(
//                       image: 'assets/images/onboarding2.png',
//                       title: 'Stay Updated',
//                       description: 'Get notifications about new releases.',
//                     ),
//                     _buildOnboardingPage(
//                       image: 'assets/images/onboarding3.png',
//                       title: 'Personalized Recommendations',
//                       description: 'Find content tailored just for you.',
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                   bottom: 40,
//                   left: 20,
//                   right: 20,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           onboardingCubit.skipOnboarding();
//                           Navigator.pushReplacementNamed(context, '/login');
//                         },
//                         child: const Text(
//                           'Skip',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                       state.currentPage == 2
//                           ? ElevatedButton(
//                               onPressed: () {
//                                 onboardingCubit.finishOnboarding();
//                                 Navigator.pushReplacementNamed(
//                                     context, '/login');
//                               },
//                               child: const Text('Get Started'),
//                             )
//                           : ElevatedButton(
//                               onPressed: () {
//                                 onboardingCubit
//                                     .updatePage(state.currentPage + 1);
//                               },
//                               child: const Text('Next'),
//                             ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildOnboardingPage({
//     required String image,
//     required String title,
//     required String description,
//   }) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Colors.blue, // Start color
//             Colors.purple, // End color
//           ],
//           begin: Alignment.topCenter, // Gradient starts at the top
//           end: Alignment.bottomCenter, // Gradient ends at the bottom
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(image, height: 250),
//             const SizedBox(height: 20),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               description,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.white70,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_movie/features/onboarding/presentation/view_model/onboarding/onboarding_cubit.dart';
// import 'package:smart_movie/features/onboarding/presentation/view_model/onboarding/onboarding_state.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     context.read<OnboardingCubit>().getOnboardingData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => OnboardingCubit(),
//       child: Scaffold(
//         body: BlocBuilder<OnboardingCubit, OnboardingState>(
//           builder: (context, state) {
//             final onboardingCubit = context.read<OnboardingCubit>();
//             return Stack(
//               children: [
//                 PageView(
//                   controller: _pageController,
//                   onPageChanged: (index) {
//                     setState(() {
//                       _currentPage = index;
//                     });
//                     onboardingCubit.updatePage(index);
//                   },
//                   children: [
//                     _buildOnboardingPage(
//                       image: 'assets/images/onboarding1.png',
//                       title: 'Welcome to SmartMovie',
//                       description: 'Explore and enjoy your favorite movies!',
//                     ),
//                     _buildOnboardingPage(
//                       image: 'assets/images/onboarding2.png',
//                       title: 'Stay Updated',
//                       description: 'Get notifications about new releases.',
//                     ),
//                     _buildOnboardingPage(
//                       image: 'assets/images/onboarding3.png',
//                       title: 'Personalized Recommendations',
//                       description: 'Find content tailored just for you.',
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                   bottom: 40,
//                   left: 20,
//                   right: 20,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           _pageController.jumpToPage(2); // Skip to the last page
//                         },
//                         child: const Text(
//                           'Skip',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                       _currentPage == 2
//                           ? ElevatedButton(
//                               onPressed: () {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => LoginView(),
//                                   ),
//                                 );
//                               },
//                               child: const Text('Get Started'),
//                             )
//                           : ElevatedButton(
//                               onPressed: () {
//                                 _pageController.nextPage(
//                                   duration: const Duration(milliseconds: 300),
//                                   curve: Curves.easeInOut,
//                                 );
//                               },
//                               child: const Text('Next'),
//                             ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildOnboardingPage({
//     required String image,
//     required String title,
//     required String description,
//   }) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Colors.blue, // Start color
//             Colors.purple, // End color
//           ],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(image, height: 250),
//             const SizedBox(height: 20),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               description,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.white70,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:smart_movie/features/auth/presentation/views/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboarding1.png',
      'title': 'Welcome to SmartMovie',
      'subtitle': 'Explore and enjoy your favorite movies!',
    },
    {
      'image': 'assets/images/onboarding2.png',
      'title': 'Stay Updates',
      'subtitle': 'Get notification about new release.',
    },
    {
      'image': 'assets/images/onboarding3.png',
      'title': 'Personalized Recommendation',
      'subtitle': 'Find content tailored just for you',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 246, 5, 85), Colors.deepPurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          onboardingData[index]['image']!,
                          height: size.height * 0.2,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: Text(
                            onboardingData[index]['title']!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            onboardingData[index]['subtitle']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        _pageController.jumpToPage(onboardingData.length - 1);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        onboardingData.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.white70,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_currentPage == onboardingData.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        _currentPage == onboardingData.length - 1
                            ? 'Done'
                            : 'Next',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
