import 'package:cinemax/data/models/movie.dart';

class MovieListModel {
  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;

  const MovieListModel({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List? ?? [];

    return MovieListModel(
      page: json['page'] ?? 1,
      movies: results
          .map((movie) => Movie.fromJson(movie as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }
}
