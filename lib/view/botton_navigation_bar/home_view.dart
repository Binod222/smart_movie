import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set the AppBar to transparent
        elevation: 0, // Remove shadow for a clean look
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0), // Remove padding for no space
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Scrollable image (adjusted to full width and smaller height)
            Image.asset(
              'assets/images/login_bg.jpg', // Replace with your image path
              width: double.infinity,
              height: 220, // Set a fixed height for the image
              fit: BoxFit
                  .cover, // Ensure the image is stretched but maintains aspect ratio
            ),
            const SizedBox(
                height: 14), // Space between the image and the search bar

            // Search bar
            TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
                height:
                    30), // Space between the search bar and "Trending Now" text

            // Category: Trending Now
            const Text(
              "Trending Now",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildHorizontalList(_trendingImages),

            const SizedBox(height: 30),

            // Category: Popular on Netflix
            const Text(
              "Popular",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildHorizontalList(_popularImages),

            const SizedBox(height: 30),

            // Category: New Releases
            const Text(
              "New Releases",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildHorizontalList(_newReleasesImages),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Lists of image paths for different categories
  final List<String> _trendingImages = [
    "assets/images/movie2.jpg",
    "assets/images/movie2.jpg",
    "assets/images/movie1.jpg",
    "assets/images/movie3.jpg",
    "assets/images/movie4.jpeg",
  ];

  final List<String> _popularImages = [
    "assets/images/movie7.jpeg",
    "assets/images/movie2.jpg",
    "assets/images/movie8.jpg",
    "assets/images/movie4.jpeg",
    "assets/images/movie5.jpeg",
  ];

  final List<String> _newReleasesImages = [
    "assets/images/movie1.jpg",
    "assets/images/movie4.jpeg",
    "assets/images/movie5.jpeg",
    "assets/images/movie6.jpg",
    "assets/images/movie7.jpeg",
  ];

  // Widget for a horizontal list of movie cards
  Widget _buildHorizontalList(List<String> imagePaths) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return _buildMovieCard(imagePaths[index]);
        },
      ),
    );
  }

  // Widget for a movie card
  Widget _buildMovieCard(String imagePath) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[900], // Dark card background
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
