// lib/features/movies/data/models/movie_model.dart

import 'package:smart_movie/features/movies/domain/entities/movie.dart';

class MovieModel {
  final String title;
  final String imageUrl;

  MovieModel({required this.title, required this.imageUrl});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],  // Adjust the key names based on your API response
      imageUrl: json['imageUrl'],  // Adjust the key names based on your API response
    );
  }

  // Convert MovieModel to Movie (Entity)
  Movie toEntity() {
    return Movie(
      title: title,
      imageUrl: imageUrl,
    );
  }
}
