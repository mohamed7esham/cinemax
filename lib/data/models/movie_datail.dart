class MovieDetailsModel {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;

  final String? posterPath;
  final String? backdropPath;

  final String releaseDate;
  final int? runtime;

  final double voteAverage;
  final int voteCount;

  final String? tagline;
  final String? status;

  final int budget;
  final int revenue;

  final List<MovieGenreModel> genres;

  const MovieDetailsModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.voteCount,
    required this.tagline,
    required this.status,
    required this.budget,
    required this.revenue,
    required this.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    final genresJson = json['genres'] as List? ?? [];

    return MovieDetailsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'] ?? '',
      runtime: json['runtime'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      tagline: json['tagline'],
      status: json['status'],
      budget: json['budget'] ?? 0,
      revenue: json['revenue'] ?? 0,
      genres: genresJson
          .map(
            (genre) => MovieGenreModel.fromJson(genre as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  String get posterUrl {
    if (posterPath == null || posterPath!.isEmpty) {
      return '';
    }

    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  String get backdropUrl {
    if (backdropPath == null || backdropPath!.isEmpty) {
      return '';
    }

    return 'https://image.tmdb.org/t/p/original$backdropPath';
  }

  String get year {
    if (releaseDate.isEmpty || releaseDate.length < 4) {
      return '';
    }

    return releaseDate.substring(0, 4);
  }

  String get duration {
    if (runtime == null) {
      return '';
    }

    final hours = runtime! ~/ 60;
    final minutes = runtime! % 60;

    if (hours == 0) {
      return '${minutes}m';
    }

    return '${hours}h ${minutes}m';
  }
}

class MovieGenreModel {
  final int id;
  final String name;

  const MovieGenreModel({required this.id, required this.name});

  factory MovieGenreModel.fromJson(Map<String, dynamic> json) {
    return MovieGenreModel(id: json['id'] ?? 0, name: json['name'] ?? '');
  }
}
