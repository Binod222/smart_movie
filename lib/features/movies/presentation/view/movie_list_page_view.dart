import 'package:flutter/material.dart';
import 'package:smart_movie/features/movies/domain/entities/movie.dart';  // Import Movie entity

class MovieList extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const MovieList({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          _buildHorizontalList(movies),
        ],
      ),
    );
  }

  // Widget for a horizontal list of movie cards
  Widget _buildHorizontalList(List<Movie> movies) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return _buildMovieCard(movies[index]);
        },
      ),
    );
  }

  // Widget for a movie card with shadow and rounded corners
  Widget _buildMovieCard(Movie movie) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900], // Dark card background
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          movie.imageUrl,  // Assuming movie has a URL for the image
          height: 160,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
