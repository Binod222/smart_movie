// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'splashscreen_state.dart';

// class SplashscreenCubit extends Cubit<SplashscreenState> {
//   SplashscreenCubit() : super(SplashscreenInitial());
// }

import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);

  void navigateToNextScreen() {
    // Emit true after a delay to simulate loading or initialization
    Future.delayed(const Duration(seconds: 2), () {
      emit(true);
    });
  }
}
