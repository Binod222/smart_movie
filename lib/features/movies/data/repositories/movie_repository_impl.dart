// lib/features/movies/data/repositories/movie_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:smart_movie/core/error/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../data_sources/movie_remote_data_source.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  // Convert MovieModel to Movie entity
  List<Movie> _mapMovieModelToEntity(List<MovieModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }

  Future<Either<Failure, List<Movie>>> getNewMovies() async {
    try {
      final movieModels = await remoteDataSource.getNewMovies();
      final movies = _mapMovieModelToEntity(movieModels);  // Convert MovieModel to Movie
      return Right(movies);
    } catch (e) {
      return Left(ApiFailure(statusCode: 500, message: "Failed to fetch new movies"));
    }
  }

  Future<Either<Failure, List<Movie>>> getTopMovies() async {
    try {
      final movieModels = await remoteDataSource.getTopMovies();
      final movies = _mapMovieModelToEntity(movieModels);  // Convert MovieModel to Movie
      return Right(movies);
    } catch (e) {
      return Left(ApiFailure(statusCode: 500, message: "Failed to fetch top movies"));
    }
  }

  Future<Either<Failure, List<Movie>>> getRandomMovies() async {
    try {
      final movieModels = await remoteDataSource.getRandomMovies();
      final movies = _mapMovieModelToEntity(movieModels);  // Convert MovieModel to Movie
      return Right(movies);
    } catch (e) {
      return Left(ApiFailure(statusCode: 500, message: "Failed to fetch random movies"));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovies(String category) async {
    try {
      final movieModels = await remoteDataSource.getMovies(category);
      final movies = _mapMovieModelToEntity(movieModels);  // Convert MovieModel to Movie
      return Right(movies);
    } catch (e) {
      return Left(ApiFailure(statusCode: 500, message: "Failed to fetch movies by category"));
    }
  }
}
