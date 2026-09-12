import 'package:cinemax/data/models/movie.dart';

abstract class MoviesState {
  const MoviesState();
}

class MoviesInitial extends MoviesState {
  const MoviesInitial();
}

class MoviesLoading extends MoviesState {
  const MoviesLoading();
}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;

  const MoviesLoaded({required this.movies});
}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError({required this.message});
}
