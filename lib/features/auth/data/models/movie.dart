
import 'package:hive_flutter/adapters.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String overview;

  @HiveField(3)
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });
}
