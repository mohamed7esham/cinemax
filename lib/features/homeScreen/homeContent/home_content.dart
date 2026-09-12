import 'package:cinemax/core/app/block/cubit/movies_cubit.dart';
import 'package:cinemax/core/app/block/cubit/movies_state.dart';
import 'package:cinemax/features/homeScreen/featuredMovie/featured_movies.dart';
import 'package:cinemax/features/homeScreen/popularSection/popular_section.dart';
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
        if (state is MoviesLoaded) {
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

                      PopularSection(movies: state.movies),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
