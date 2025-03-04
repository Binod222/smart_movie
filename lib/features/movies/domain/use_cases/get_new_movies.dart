import 'package:dartz/dartz.dart';
import 'package:smart_movie/core/error/failure.dart';

import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase(this.repository);

  Future<Either<Failure, List<Movie>>> call(String category) async {
    return await repository.getMovies(category);
  }
}
