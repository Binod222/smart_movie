// class Movie {
//   final String id;
//   final String title;
//   final String description;
//   final String imageUrl;
//   final String genre;

//   Movie({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//     required this.genre,
//   });
// }


class Movie {
  final String title;
  final String imageUrl;

  Movie({required this.title, required this.imageUrl});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],  // Adjust as per your actual JSON structure
      imageUrl: json['imageUrl'],  // Adjust as per your actual JSON structure
    );
  }
}
