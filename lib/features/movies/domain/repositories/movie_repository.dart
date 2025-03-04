// lib/features/movies/domain/repositories/movie_repository.dart

import 'package:dartz/dartz.dart';
import 'package:smart_movie/core/error/failure.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNewMovies();
  Future<Either<Failure, List<Movie>>> getTopMovies();
  Future<Either<Failure, List<Movie>>> getRandomMovies();
  Future<Either<Failure, List<Movie>>> getMovies(String category);
}
