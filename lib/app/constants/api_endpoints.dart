class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 5000);
  static const String baseUrl = "http://10.0.2.2:3000/api/v1";

  // ====================== Auth Routes =========================
  static const String login = "/users/auth"; //Login user
  static const String register = "/users"; // Register new user
  static const String getAllUsers = "/users"; //Get all user
  // static const String uploadImage = "/user/uploadImage";
  static const String avatarUpload = "/users/profile";
  // // ====================== User Profile =========================
  // static const String getCurrentUserProfile = "/users/profile";  // Get current user profile (GET)
  // static const String updateCurrentUserProfile = "/users/profile";  // Update current user profile (PUT)

  // // ====================== Logout =========================
  // static const String logout = "/users/logout";  // Logout current user (POST)
}
