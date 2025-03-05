import 'package:dio/dio.dart';
import 'package:smart_movie/core/network/api_service.dart';
import '../models/profile_model.dart';

class ProfileRepository {
  final ApiService apiService;

  ProfileRepository({required this.apiService});

  Future<ProfileModel> getProfile(String userId) async {
    try {
      final response = await apiService.dio.get('/profile/$userId');
      return ProfileModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to fetch profile');
    }
  }
}
