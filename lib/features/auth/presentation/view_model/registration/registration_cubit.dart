import 'package:flutter_bloc/flutter_bloc.dart';
import 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  void register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(RegistrationLoading());

    try {
      // Simulating network call with a delay
      await Future.delayed(const Duration(seconds: 2));

      // Dummy logic for successful registration
      if (email == "test@test.com") {
        throw Exception("Email already in use.");
      }

      // Emit success state if registration succeeds
      emit(RegistrationSuccess("Registration Successful!"));
    } catch (e) {
      // Emit error state if registration fails
      emit(RegistrationError(e.toString()));
    }
  }
}
