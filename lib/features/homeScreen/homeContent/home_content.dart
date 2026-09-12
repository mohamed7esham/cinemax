import 'package:cinemax/core/app/block/cubit/movies_cubit.dart';
import 'package:cinemax/core/app/block/cubit/movies_state.dart';
import 'package:cinemax/features/homeScreen/featuredMovie/featured_movies.dart';
import 'package:cinemax/features/homeScreen/widgets/search_bar.dart';
import 'package:cinemax/features/homeScreen/widgets/categories.dart';
import 'package:cinemax/features/homeScreen/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  final List<String> categories = const [
    'All',
    'Comedy',
    'Animation',
    'Documentary',
  ];

  // final List<Movie> popularMovies = [
  //   Movie(
  //     title: 'Spider-Man No Way Home',
  //     genre: 'Action',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1635805737707-575885ab0820?w=600',
  //     rating: 4.5,
  //     description: 'Action movie',
  //   ),
  //   Movie(
  //     title: 'Life of Pi',
  //     genre: 'Adventure',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=600',
  //     rating: 4.5,
  //     description: 'Adventure movie',
  //   ),
  //   Movie(
  //     title: 'Riverdale',
  //     genre: 'Drama',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=600',
  //     rating: 4.3,
  //     description: 'Drama movie',
  //   ),
  // ];

  // final List<Movie> featuredMovies = [
  //   Movie(
  //     title: 'Black Panther: Wakanda Forever',
  //     genre: 'Action',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1534447677768-be436bb09401?w=1200',
  //     rating: 4.7,
  //     description: 'Marvel movie',
  //   ),
  //   Movie(
  //     title: 'Avengers',
  //     genre: 'Action',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1635863138275-d9b33299680b?w=1200',
  //     rating: 4.8,
  //     description: 'Marvel movie',
  //   ),
  //   Movie(
  //     title: 'The Batman',
  //     genre: 'Action',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1531259683007-016a7b628fc3?w=1200',
  //     rating: 4.6,
  //     description: 'Action movie',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MoviesError) {
          return Center(child: Text(state.message));
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(),
                    SizedBox(height: 20.h),
                    const CustomSearchBar(),

                    SizedBox(height: 24.h),

                    FeaturedMovies(),
                    SizedBox(height: 28.h),

                    Categories(categories: categories),

                    SizedBox(height: 28.h),

                    // PopularSection(movies: popularMovies),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
