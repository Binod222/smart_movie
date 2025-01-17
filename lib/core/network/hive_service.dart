import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final String userBoxName = 'userBox'; // Box to store user data

  /// Initialize Hive and open the box
  Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox<Map>(userBoxName);
  }

  /// Registers a new user
  Future<bool> registerUser({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final box = Hive.box<Map>(userBoxName);

    // Check if the email already exists
    if (box.containsKey(email)) {
      return false; // Email already exists
    }

    // Save the user details
    await box.put(email, {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'password': password, // Store password as plain text for simplicity
    });

    return true; // Registration successful
  }

  /// Login validation
  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    final box = Hive.box<Map>(userBoxName);

    // Check if the email exists in the database
    if (!box.containsKey(email)) {
      return false; // Email not found
    }

    // Retrieve the user details and validate the password
    final userData = box.get(email);
    return userData?['password'] == password;
  }
}
