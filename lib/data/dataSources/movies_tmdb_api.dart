import 'package:cinemax/data/models/category_list_model.dart';
import 'package:cinemax/data/models/movie_datail.dart';
import 'package:cinemax/data/models/movie_list.dart';
import 'package:dio/dio.dart';

class TmdbApi {
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NzBhZTY1NjVlMDc3MzZkODZhNmNjMGEzM2E2ODUwZiIsIm5iZiI6MTc4OTE5NTYwOC4yODE5OTk4LCJzdWIiOiI2YWE0ZjU1ODJjMmRmMzI1YzAzNWQ5YzEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.7b7dh-Fo7Zq02MiB8xT8g0K0P_0cKIaKHrcx2QOlCRc';
  // String.fromEnvironment('TMDB_ACCESS_TOKEN');

  late final Dio dio;

  TmdbApi() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Authorization': 'Bearer $token',
          'accept': 'application/json',
        },
      ),
    );
  }

  Future<MovieListModel> getTrendingMovies({String timeWindow = 'day'}) async {
    final response = await dio.get(
      '/trending/movie/$timeWindow',
      queryParameters: {'language': 'en-US'},
    );

    return MovieListModel.fromJson(response.data);
  }

  Future<MovieListModel> getPopularMovies({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'language': 'en-US', 'page': page},
    );

    return MovieListModel.fromJson(response.data);
  }

  Future<CategoryList> getMovieCategories() async {
    final response = await dio.get(
      '/genre/movie/list',
      queryParameters: {'language': 'en'},
    );

    return CategoryList.fromJson(response.data);
  }

  Future<MovieListModel> getRecommendedMovies({
    required int movieId,
    int page = 1,
  }) async {
    final response = await dio.get(
      '/movie/$movieId/recommendations',
      queryParameters: {'language': 'en-US', 'page': page},
    );

    return MovieListModel.fromJson(response.data);
  }

  // TODAY / NOW PLAYING
  Future<MovieListModel> getNowPlayingMovies({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'language': 'en-US', 'page': page},
    );

    return MovieListModel.fromJson(response.data);
  }

  Future<MovieListModel> searchMovies({
    required String query,
    int page = 1,
  }) async {
    final response = await dio.get(
      '/search/movie',
      queryParameters: {
        'query': query,
        'include_adult': false,
        'language': 'en-US',
        'page': page,
      },
    );

    return MovieListModel.fromJson(response.data);
  }

  Future<MovieDetailsModel> getMovieDetails({required int movieId}) async {
    final response = await dio.get(
      '/movie/$movieId',
      queryParameters: {'language': 'en-US'},
    );

    return MovieDetailsModel.fromJson(response.data);
  }
}
