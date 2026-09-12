import 'package:cinemax/data/dataSources/movies_tmdb_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final TmdbApi api;

  MoviesCubit({TmdbApi? api})
    : api = api ?? TmdbApi(),
      super(const MoviesInitial());

  Future<void> loadPopularMovies() async {
    emit(const MoviesLoading());

    try {
      final result = await api.getPopularMovies();

      emit(MoviesLoaded(movies: result.movies));
    } catch (e) {
      emit(MoviesError(message: e.toString()));
    }
  }

  Future<void> loadTrendingMovies() async {
    emit(const MoviesLoading());

    try {
      final result = await api.getTrendingMovies();

      emit(MoviesLoaded(movies: result.movies));
    } catch (e) {
      emit(MoviesError(message: e.toString()));
    }
  }
}
