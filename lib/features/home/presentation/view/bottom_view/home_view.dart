// import 'package:flutter/material.dart';
// import 'package:smart_movie/features/movies/presentation/view/movie_detail_page_view.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30)),
//               child: Image.asset(
//                 'assets/images/login_bg.jpg', // Add your background image
//                 width: double.infinity,
//                 height: 250,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   hintText: "Search for movies",
//                   hintStyle: TextStyle(color: Colors.grey[500]),
//                   prefixIcon: const Icon(Icons.search, color: Colors.white),
//                   filled: true,
//                   fillColor: Colors.grey[800],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                   contentPadding: const EdgeInsets.all(15),
//                 ),
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 30),
//             _buildCategorySection("Trending Now", _trendingMovies, context),
//             const SizedBox(height: 30),
//             _buildCategorySection("Popular", _popularMovies, context),
//             const SizedBox(height: 30),
//             _buildCategorySection("New Releases", _newReleasesMovies, context),
//           ],
//         ),
//       ),
//     );
//   }

//   final List<Map<String, String>> _trendingMovies = [
//     {
//       'title': "Inception",
//       'year': "2010",
//       'description': "A mind-bending thriller by Christopher Nolan.",
//       'poster': "assets/images/inception.jpg", // Use your asset paths here
//     },
//     {
//       'title': "Interstellar",
//       'year': "2014",
//       'description': "A sci-fi masterpiece exploring space and time.",
//       'poster': "assets/images/interstellar.jpg",
//     },
//     {
//       'title': "The Dark Knight Rises",
//       'year': "2012",
//       'description': "The final chapter of Nolan's Batman trilogy.",
//       'poster': "assets/images/the_dark_knight-rises.jpg", // New Movie Added
//     },
//     {
//       'title': "Dunkirk",
//       'year': "2017",
//       'description': "A World War II thriller from Christopher Nolan.",
//       'poster': "assets/images/dunkirk.jpg", // New Movie Added
//     },
//   ];

//   final List<Map<String, String>> _popularMovies = [
//     {
//       'title': "The Dark Knight",
//       'year': "2008",
//       'description': "The iconic Batman movie with Heath Ledger's Joker.",
//       'poster': "assets/images/dark_knight.jpg",
//     },
//     {
//       'title': "The Matrix",
//       'year': "1999",
//       'description': "A revolutionary sci-fi film that defined the genre.",
//       'poster': "assets/images/matrix.jpg",
//     },
//     {
//       'title': "Avengers: Endgame",
//       'year': "2019",
//       'description': "The epic conclusion to the Infinity Saga.",
//       'poster': "assets/images/avengers_endgame.jpg", // New Movie Added
//     },
//     {
//       'title': "Guardians of the Galaxy",
//       'year': "2014",
//       'description':
//           "A group of intergalactic misfits team up to save the universe.",
//       'poster': "assets/images/guardians_galaxy.jpg", // New Movie Added
//     },
//     {
//       'title': "K.G.F Chapter 2",
//       'year': "2022",
//       'description':
//           "The highly anticipated sequel to KGF, following Rocky's journey.",
//       'poster': "assets/images/kgf_chapter2.jpg",
//     }
//   ];

//   final List<Map<String, String>> _newReleasesMovies = [
//     {
//       'title': "Salaar",
//       'year': "2022",
//       'description':
//           "A fierce and powerful man, Salaar, seeks vengeance in a world full of violence and crime.",
//       'poster': "assets/images/salaar.jpeg",
//     },
//     {
//       'title': "Avatar: The Way of Water",
//       'year': "2022",
//       'description': "The highly anticipated sequel to Avatar.",
//       'poster': "assets/images/avatar.jpg",
//     },
//     {
//       'title': "Spider-Man: No Way Home",
//       'year': "2021",
//       'description':
//           "The multiverse saga continues in this epic Spider-Man adventure.",
//       'poster': "assets/images/spider_man_no_way_home.jpg",
//     },
//     {
//       'title': "Black Panther: Wakanda Forever",
//       'year': "2022",
//       'description':
//           "The sequel to the 2018 hit, following the death of T'Challa.",
//       'poster':
//           "assets/images/blackpanther_wakandaforever.jpg", // New Movie Added
//     },
//     {
//       'title': "Doctor Strange in the Multiverse of Madness",
//       'year': "2022",
//       'description': "Doctor Strange delves into the multiverse.",
//       'poster': "assets/images/doctore_strange.jpg", // New Movie Added
//     },
//   ];

//   Widget _buildCategorySection(
//       String title, List<Map<String, String>> movieList, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 16),
//           _buildHorizontalList(movieList, context),
//         ],
//       ),
//     );
//   }

//   Widget _buildHorizontalList(
//       List<Map<String, String>> movieList, BuildContext context) {
//     return SizedBox(
//       height: 160,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: movieList.length,
//         itemBuilder: (context, index) {
//           return _buildMovieCard(movieList[index], context);
//         },
//       ),
//     );
//   }

//   Widget _buildMovieCard(Map<String, String> movie, BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to MovieDetailPage with the necessary details
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MovieDetailPage(
//               title: movie['title']!,
//               year: movie['year']!,
//               poster: movie['poster']!,
//               description: movie['description']!,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         width: 120,
//         margin: const EdgeInsets.only(right: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.grey[900],
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black,
//               blurRadius: 8,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.asset(
//             movie['poster']!,
//             height: 160,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:smart_movie/features/movies/presentation/view/movie_detail_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller to manage search text
  final TextEditingController _searchController = TextEditingController();

  // Initial movie lists
  final List<Map<String, String>> _trendingMovies = [
    {
      'title': "Inception",
      'year': "2010",
      'description': "A mind-bending thriller by Christopher Nolan.",
      'poster': "assets/images/inception.jpg",
    },
    {
      'title': "Interstellar",
      'year': "2014",
      'description': "A sci-fi masterpiece exploring space and time.",
      'poster': "assets/images/interstellar.jpg",
    },
    {
      'title': "The Dark Knight Rises",
      'year': "2012",
      'description': "The final chapter of Nolan's Batman trilogy.",
      'poster': "assets/images/the_dark_knight-rises.jpg",
    },
    {
      'title': "Dunkirk",
      'year': "2017",
      'description': "A World War II thriller from Christopher Nolan.",
      'poster': "assets/images/dunkirk.jpg",
    },
  ];

  final List<Map<String, String>> _popularMovies = [
    {
      'title': "The Dark Knight",
      'year': "2008",
      'description': "The iconic Batman movie with Heath Ledger's Joker.",
      'poster': "assets/images/dark_knight.jpg",
    },
    {
      'title': "The Matrix",
      'year': "1999",
      'description': "A revolutionary sci-fi film that defined the genre.",
      'poster': "assets/images/matrix.jpg",
    },
    {
      'title': "Avengers: Endgame",
      'year': "2019",
      'description': "The epic conclusion to the Infinity Saga.",
      'poster': "assets/images/avengers_endgame.jpg",
    },
    {
      'title': "Guardians of the Galaxy",
      'year': "2014",
      'description':
          "A group of intergalactic misfits team up to save the universe.",
      'poster': "assets/images/guardians_galaxy.jpg",
    },
    {
      'title': "K.G.F Chapter 2",
      'year': "2022",
      'description':
          "The highly anticipated sequel to KGF, following Rocky's journey.",
      'poster': "assets/images/kgf_chapter2.jpg",
    }
  ];

  final List<Map<String, String>> _newReleasesMovies = [
    {
      'title': "Salaar",
      'year': "2022",
      'description':
          "A fierce and powerful man, Salaar, seeks vengeance in a world full of violence and crime.",
      'poster': "assets/images/salaar.jpeg",
    },
    {
      'title': "Avatar: The Way of Water",
      'year': "2022",
      'description': "The highly anticipated sequel to Avatar.",
      'poster': "assets/images/avatar.jpg",
    },
    {
      'title': "Spider-Man: No Way Home",
      'year': "2021",
      'description':
          "The multiverse saga continues in this epic Spider-Man adventure.",
      'poster': "assets/images/spider_man_no_way_home.jpg",
    },
    {
      'title': "Black Panther: Wakanda Forever",
      'year': "2022",
      'description':
          "The sequel to the 2018 hit, following the death of T'Challa.",
      'poster': "assets/images/blackpanther_wakandaforever.jpg",
    },
    {
      'title': "Doctor Strange in the Multiverse of Madness",
      'year': "2022",
      'description': "Doctor Strange delves into the multiverse.",
      'poster': "assets/images/doctore_strange.jpg",
    },
  ];

  // Filtered lists for each category
  List<Map<String, String>> _filteredTrendingMovies = [];
  List<Map<String, String>> _filteredPopularMovies = [];
  List<Map<String, String>> _filteredNewReleasesMovies = [];

  @override
  void initState() {
    super.initState();

    // Initially, the filtered lists are all the movies in their respective categories
    _filteredTrendingMovies = List.from(_trendingMovies);
    _filteredPopularMovies = List.from(_popularMovies);
    _filteredNewReleasesMovies = List.from(_newReleasesMovies);

    // Listen to changes in the search query
    _searchController.addListener(() {
      _filterMovies();
    });
  }

  // Function to filter movies based on the search query
  void _filterMovies() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      // Filter each category separately
      _filteredTrendingMovies = _trendingMovies
          .where((movie) => movie['title']!.toLowerCase().contains(query))
          .toList();
      _filteredPopularMovies = _popularMovies
          .where((movie) => movie['title']!.toLowerCase().contains(query))
          .toList();
      _filteredNewReleasesMovies = _newReleasesMovies
          .where((movie) => movie['title']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: Image.asset(
                'assets/images/login_bg.jpg', // Add your background image
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: _searchController,
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
                  contentPadding: const EdgeInsets.all(15),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            _buildCategorySection(
                "Trending Now", _filteredTrendingMovies, context),
            const SizedBox(height: 30),
            _buildCategorySection("Popular", _filteredPopularMovies, context),
            const SizedBox(height: 30),
            _buildCategorySection(
                "New Releases", _filteredNewReleasesMovies, context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(
      String title, List<Map<String, String>> movieList, BuildContext context) {
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
          _buildHorizontalList(movieList, context),
        ],
      ),
    );
  }

  Widget _buildHorizontalList(
      List<Map<String, String>> movieList, BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return _buildMovieCard(movieList[index], context);
        },
      ),
    );
  }

  Widget _buildMovieCard(Map<String, String> movie, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to MovieDetailPage with the necessary details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(
              title: movie['title']!,
              year: movie['year']!,
              poster: movie['poster']!,
              description: movie['description']!,
            ),
          ),
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[900],
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
          child: Image.asset(
            movie['poster']!,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
