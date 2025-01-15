import 'package:smart_movie/features/auth/data/models/user_model.dart';

class AuthRepository {
  Future<UserModel?> login(String email, String password) async {
    // Simulated API call
    if (email == "test@example.com" && password == "password") {
      return UserModel(id: "1", name: "Test User", email: email);
    }
    return null;
  }

  Future<bool> register(String name, String email, String password) async {
    // Simulated registration logic
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
