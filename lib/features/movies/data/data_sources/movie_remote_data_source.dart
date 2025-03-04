import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNewMovies();
  Future<List<MovieModel>> getTopMovies();
  Future<List<MovieModel>> getRandomMovies();
  Future<List<MovieModel>> getMovies(String category); // ✅ Add this method
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  static const String baseUrl = "http://your-server.com/api";

  @override
  Future<List<MovieModel>> getNewMovies() async {
    return _fetchMovies("$baseUrl/movies/new");
  }

  @override
  Future<List<MovieModel>> getTopMovies() async {
    return _fetchMovies("$baseUrl/movies/top");
  }

  @override
  Future<List<MovieModel>> getRandomMovies() async {
    return _fetchMovies("$baseUrl/movies/random");
  }

  @override
  Future<List<MovieModel>> getMovies(String category) async {
    return _fetchMovies("$baseUrl/movies?category=$category"); // ✅ Added this
  }

  Future<List<MovieModel>> _fetchMovies(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
