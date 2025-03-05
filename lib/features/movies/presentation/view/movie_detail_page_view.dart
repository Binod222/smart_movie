// import 'package:flutter/material.dart';

// class MovieDetailPage extends StatefulWidget {
//   final String title;
//   final String year;
//   final String poster;
//   final String description;

//   const MovieDetailPage({
//     super.key,
//     required this.title,
//     required this.year,
//     required this.poster,
//     required this.description,
//   });

//   @override
//   _MovieDetailPageState createState() => _MovieDetailPageState();
// }

// class _MovieDetailPageState extends State<MovieDetailPage> {
//   final TextEditingController _reviewController = TextEditingController();
//   final Map<String, List<String>> movieReviews = {
//     "Inception": [
//       "Mind-blowing concept! ⭐⭐⭐⭐⭐",
//       "A masterpiece by Nolan! 🎥🔥",
//       "Great visual effects and storytelling. 🎭"
//     ],
//     "Interstellar": [
//       "A beautiful sci-fi experience! 🚀",
//       "Hans Zimmer’s soundtrack is amazing! 🎶",
//       "Emotional and scientifically engaging. 🌌"
//     ],
//     "The Dark Knight": [
//       "Best Batman movie ever! 🦇",
//       "Heath Ledger’s Joker is legendary! 🃏",
//       "Dark, gripping, and intense. 💥"
//     ],
//   };

//   List<String> get currentReviews =>
//       movieReviews[widget.title] ?? ["No reviews yet. Be the first to review!"];

//   void _addReview() {
//     if (_reviewController.text.isNotEmpty) {
//       setState(() {
//         // If the movie title does not have any reviews yet, initialize it with an empty list.
//         if (movieReviews[widget.title] == null) {
//           movieReviews[widget.title] = [];
//         }
//         // Add the new review to the list of reviews.
//         movieReviews[widget.title]!.insert(0, _reviewController.text);
//       });
//       _reviewController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.black.withOpacity(0.6),
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               widget.poster.isNotEmpty
//                   ? widget.poster
//                   : 'assets/images/default_poster.jpg', // Fallback image
//               fit: BoxFit.cover,
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.black.withOpacity(0.7),
//                   Colors.black.withOpacity(0.9),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 80),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Image.asset(
//                     widget.poster.isNotEmpty
//                         ? widget.poster
//                         : 'assets/images/default_poster.jpg', // Fallback image
//                     height: 300,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   widget.title,
//                   style: const TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 Text(
//                   "Year: ${widget.year}",
//                   style: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.description,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             color: Colors.white70,
//                           ),
//                           textAlign: TextAlign.justify,
//                         ),
//                         const SizedBox(height: 20),
//                         const Text(
//                           "Reviews",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: currentReviews.length,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               color: Colors.black54,
//                               margin: const EdgeInsets.symmetric(vertical: 5),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: Text(
//                                   currentReviews[index],
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 10),
//                         TextField(
//                           controller: _reviewController,
//                           style: const TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.black54,
//                             hintText: "Write a review...",
//                             hintStyle: const TextStyle(color: Colors.white70),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: _addReview,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.redAccent,
//                           ),
//                           child: const Text("Submit Review"),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  final String title;
  final String year;
  final String poster;
  final String description;

  const MovieDetailPage({
    super.key,
    required this.title,
    required this.year,
    required this.poster,
    required this.description,
  });

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final TextEditingController _reviewController = TextEditingController();
  final Map<String, List<String>> movieReviews = {
    "Inception": [
      "Mind-blowing concept! ⭐⭐⭐⭐⭐",
      "A masterpiece by Nolan! 🎥🔥",
      "Great visual effects and storytelling. 🎭"
    ],
    "Interstellar": [
      "A beautiful sci-fi experience! 🚀",
      "Hans Zimmer’s soundtrack is amazing! 🎶",
      "Emotional and scientifically engaging. 🌌"
    ],
    "The Dark Knight": [
      "Best Batman movie ever! 🦇",
      "Heath Ledger’s Joker is legendary! 🃏",
      "Dark, gripping, and intense. 💥"
    ],
  };

  bool isFavorite = false; // Track the favorite state of the movie

  List<String> get currentReviews =>
      movieReviews[widget.title] ?? ["No reviews yet. Be the first to review!"];

  void _addReview() {
    if (_reviewController.text.isNotEmpty) {
      setState(() {
        if (movieReviews[widget.title] == null) {
          movieReviews[widget.title] = [];
        }
        movieReviews[widget.title]!.insert(0, _reviewController.text);
      });
      _reviewController.clear();
    }
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Toggle the favorite state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.6),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.redAccent,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              widget.poster.isNotEmpty
                  ? widget.poster
                  : 'assets/images/default_poster.jpg', // Fallback image
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    widget.poster.isNotEmpty
                        ? widget.poster
                        : 'assets/images/default_poster.jpg', // Fallback image
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Year: ${widget.year}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: currentReviews.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.black54,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  currentReviews[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _reviewController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black54,
                            hintText: "Write a review...",
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _addReview,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                          ),
                          child: const Text("Submit Review"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
