import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_movie/features/auth/presentation/view_model/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // Dummy login credentials
  final String dummyEmail = "binod@gmail.com";
  final String dummyPassword = "pass123";

  void login(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      emit(const LoginError("Please enter both email and password"));
      return;
    }

    String emailPattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    RegExp regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(email)) {
      emit(const LoginError("Please enter a valid email"));
      return;
    }

    emit(LoginLoading());
    Future.delayed(const Duration(seconds: 2), () {
      if (email == dummyEmail && password == dummyPassword) {
        emit(LoginSuccess());
      } else {
        emit(const LoginError("Invalid email or password"));
      }
    });
  }
}
