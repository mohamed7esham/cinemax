import 'package:cinemax/data/models/category.dart';

class CategoryList {
  final List<Category> genres;

  const CategoryList({required this.genres});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    final results = json['genres'] as List? ?? [];

    return CategoryList(
      genres: results
          .map((genre) => Category.fromJson(genre as Map<String, dynamic>))
          .toList(),
    );
  }
}
