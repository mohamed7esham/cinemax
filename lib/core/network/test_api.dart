import 'package:cinemax/data/dataSources/movies_tmdb_api.dart';
import 'package:flutter/material.dart';

Future<void> testApi() async {
  final api = TmdbApi();

  try {
    debugPrint('========== TMDB API TEST ==========');

    final result = await api.getTrendingMovies();

    debugPrint('Number of movies: ${result.movies.length}');

    for (final movie in result.movies.take(5)) {
      debugPrint('ID: ${movie.id}');
      debugPrint('Title: ${movie.title}');
      debugPrint('Rating: ${movie.voteAverage}');
      debugPrint('Poster: ${movie.posterUrl}');
      debugPrint('----------------------------');
    }

    debugPrint('========== TEST SUCCESS ==========');
  } catch (e) {
    debugPrint('========== TEST FAILED ==========');
    debugPrint(e.toString());
  }
}
