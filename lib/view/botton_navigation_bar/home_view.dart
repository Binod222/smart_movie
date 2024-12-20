import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0), // Remove padding for no space
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with rounded corners
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: Image.asset(
                'assets/images/login_bg.jpg', // Replace with your image path
                width: double.infinity,
                height: 250, // Set a fixed height for the image
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
                height: 20), // Space between the image and the search bar

            // Search bar with rounded corners
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search for movies",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(
                      15), // Adds space inside the text field
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(
                height: 30), // Space between the search bar and the title text

            // Category: Trending Now
            _buildCategorySection("Trending Now", _trendingImages),

            const SizedBox(height: 30), // Space between categories

            // Category: Popular
            _buildCategorySection("Popular", _popularImages),

            const SizedBox(height: 30), // Space between categories

            // Category: New Releases
            _buildCategorySection("New Releases", _newReleasesImages),
          ],
        ),
      ),
    );
  }

  // Lists of image paths for different categories
  final List<String> _trendingImages = [
    "assets/images/movie2.jpg",
    "assets/images/movie1.jpg",
    "assets/images/movie3.jpg",
    "assets/images/movie4.jpeg",
    "assets/images/movie5.jpg",
  ];

  final List<String> _popularImages = [
    "assets/images/movie7.jpeg",
    "assets/images/movie8.jpg",
    "assets/images/movie4.jpeg",
    "assets/images/movie5.jpeg",
    "assets/images/movie6.jpg",
  ];

  final List<String> _newReleasesImages = [
    "assets/images/movie1.jpg",
    "assets/images/movie4.jpeg",
    "assets/images/movie5.jpeg",
    "assets/images/movie6.jpg",
    "assets/images/movie7.jpeg",
  ];

  // Widget for a movie category section
  Widget _buildCategorySection(String title, List<String> imagePaths) {
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
          _buildHorizontalList(imagePaths),
        ],
      ),
    );
  }

  // Widget for a horizontal list of movie cards
  Widget _buildHorizontalList(List<String> imagePaths) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return _buildMovieCard(imagePaths[index]);
        },
      ),
    );
  }

  // Widget for a movie card with shadow and rounded corners
  Widget _buildMovieCard(String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900], // Dark card background
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          height: 160,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
