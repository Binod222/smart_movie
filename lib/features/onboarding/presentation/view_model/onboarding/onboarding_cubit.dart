// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'onboarding_state.dart';

// class OnboardingCubit extends Cubit<OnboardingState> {
//   OnboardingCubit() : super(OnboardingInitial());
// }

import 'package:bloc/bloc.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  void updatePage(int index) {
    emit(state.copyWith(currentPage: index));
  }

  void skipOnboarding() {
    // Handle skipping logic (e.g., saving to shared preferences)
  }

  void finishOnboarding() {
    // Handle finishing logic (e.g., navigate to login)
  }
}
