// part of 'onboarding_cubit.dart';

// sealed class OnboardingState extends Equatable {
//   const OnboardingState();

//   @override
//   List<Object> get props => [];
// }

// final class OnboardingInitial extends OnboardingState {}

import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentPage;

  const OnboardingState({this.currentPage = 0});

  @override
  List<Object?> get props => [currentPage];

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
