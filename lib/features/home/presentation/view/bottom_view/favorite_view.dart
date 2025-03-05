import 'package:flutter/material.dart';
import 'package:smart_movie/features/movies/presentation/view/movie_detail_page_view.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> favoriteMovies = [
      {
        "title": "Inception",
        "year": "2010",
        "poster": "assets/images/inception.jpg", // Local image asset
        "description":
            "A thief who enters the dreams of others to steal secrets must plant an idea into a target's subconscious."
      },
      {
        "title": "Interstellar",
        "year": "2014",
        "poster": "assets/images/interstellar.jpg", // Local image asset
        "description":
            "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival."
      },
      {
        "title": "The Dark Knight",
        "year": "2008",
        "poster": "assets/images/dark_knight.jpg", // Local image asset
        "description":
            "Batman faces the Joker, a criminal mastermind who wants to plunge Gotham into anarchy."
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: const Text(
          "Favorite Movies",
          style: TextStyle(
              color: Colors.white), // Set the app bar title color to white
        ),
        backgroundColor: Colors.transparent, // Transparent app bar like Netflix
        elevation: 0, // No shadow under app bar
        iconTheme: const IconThemeData(color: Colors.white), // White icons
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: favoriteMovies.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                        title: favoriteMovies[index]["title"]!,
                        year: favoriteMovies[index]["year"]!,
                        poster: favoriteMovies[index]["poster"]!,
                        description: favoriteMovies[index]["description"]!,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      // Movie Poster (now using local assets)
                      Image.asset(
                        favoriteMovies[index]["poster"]!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Gradient Overlay (Netflix effect)
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                        ),
                      ),
                      // Movie Title
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Text(
                          favoriteMovies[index]["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Favorite Icon
                      Positioned(
                        top: 10,
                        right: 10,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
