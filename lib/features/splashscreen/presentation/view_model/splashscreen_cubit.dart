// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'splashscreen_state.dart';

// class SplashscreenCubit extends Cubit<SplashscreenState> {
//   SplashscreenCubit() : super(SplashscreenInitial());
// }

import 'package:bloc/bloc.dart';
import 'package:smart_movie/features/auth/presentation/view_model/login/login_bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit(LoginBloc loginBloc) : super(false);

  void navigateToNextScreen() {
    // Emit true after a delay to simulate loading or initialization
    Future.delayed(const Duration(seconds: 2), () {
      emit(true);
    });
  }
}
