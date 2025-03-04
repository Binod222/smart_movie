import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smart_movie/app/constants/api_endpoints.dart';
import 'package:smart_movie/core/network/dio_error_interceptor.dart';

class ApiService {
  final Dio _dio;

  Dio get dio => _dio;

  ApiService(this._dio) {
    _dio
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.connectTimeout = ApiEndpoints.connectionTimeout
      ..options.receiveTimeout = ApiEndpoints.receiveTimeout
      ..interceptors.add(DioErrorInterceptor())
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true))
      ..options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
  }
}

// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smart_movie/app/constants/api_endpoints.dart';
// import 'package:smart_movie/core/network/dio_error_interceptor.dart';

// class ApiService {
//   final Dio _dio;

//   Dio get dio => _dio;

//   ApiService(this._dio) {
//     _dio
//       ..options.baseUrl = ApiEndpoints.baseUrl
//       ..options.connectTimeout = ApiEndpoints.connectionTimeout
//       ..options.receiveTimeout = ApiEndpoints.receiveTimeout
//       ..options.headers = {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//       }
//       ..interceptors.add(DioErrorInterceptor())
//       ..interceptors.add(PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseHeader: true,
//       ));
//   }

//   Future<void> _setAuthHeader() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString("token");
//     if (token != null) {
//       _dio.options.headers["Authorization"] = "Bearer $token";
//     }
//   }

//   Future<Response> get(String path) async {
//     await _setAuthHeader();
//     return await _dio.get(path);
//   }

//   Future<Response> post(String path, dynamic data) async {
//     await _setAuthHeader();
//     return await _dio.post(path, data: data);
//   }

//   Future<Response> put(String path, dynamic data) async {
//     await _setAuthHeader();
//     return await _dio.put(path, data: data);
//   }

//   Future<Response> delete(String path) async {
//     await _setAuthHeader();
//     return await _dio.delete(path);
//   }
// }
