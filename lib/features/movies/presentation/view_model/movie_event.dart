abstract class MovieEvent {}

class GetMovies extends MovieEvent {
  final String category;

  GetMovies(this.category);
}
