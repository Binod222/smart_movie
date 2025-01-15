
import 'package:hive_flutter/adapters.dart';
import 'package:smart_movie/features/auth/data/models/movie.dart';

class LocalDataSource {
  final Box<Movie> _movieBox;

  LocalDataSource(this._movieBox);

  Future<void> saveMovies(List<Movie> movies) async {
    for (var movie in movies) {
      await _movieBox.put(movie.id, movie);
    }
  }

  List<Movie> getMovies() {
    return _movieBox.values.toList();
  }

  Future<void> clearMovies() async {
    await _movieBox.clear();
  }
}
