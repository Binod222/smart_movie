import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_movie/features/movies/domain/use_cases/get_new_movies.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMoviesUseCase getMoviesUseCase;

  MovieBloc({required this.getMoviesUseCase}) : super(MovieInitial()) {
    on<GetMovies>((event, emit) async {
      emit(MovieLoading());
      final result = await getMoviesUseCase(event.category);

      result.fold(
        (failure) {
          emit(MovieError("Failed to fetch movies: ${failure.message}"));
        },
        (movies) {
          emit(MovieLoaded(movies)); // Emit MovieLoaded state with the list of movies
        },
      );
    });
  }
}
