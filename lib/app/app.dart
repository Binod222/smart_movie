import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_movie/app/di/di.dart';
import 'package:smart_movie/core/config/app_config.dart';
import 'package:smart_movie/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:smart_movie/features/auth/presentation/view_model/registration/register_bloc.dart';
import 'package:smart_movie/features/onboarding/presentation/view_model/onboarding/onboarding_cubit.dart';
import 'package:smart_movie/features/splashscreen/presentation/view_model/splashscreen_cubit.dart';
import 'package:smart_movie/features/splashscreen/presentation/views/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (_) => getIt<SplashCubit>(),
        ),
        BlocProvider<OnboardingCubit>(
          create: (_) => getIt<OnboardingCubit>(),
        ),
        BlocProvider<RegisterBloc>(
          create: (_) => getIt<RegisterBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => getIt<LoginBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Movie',
        theme: AppTheme.getApplicationTheme(isDarkMode: false),
        home: const SplashScreenPage(),
      ),
    );
  }
}
