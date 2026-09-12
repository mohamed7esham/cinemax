import 'package:cinemax/core/app/block/cubit/movies_cubit.dart';
import 'package:cinemax/core/app/block/cubit/movies_state.dart';
import 'package:cinemax/features/homeScreen/widgets/categories.dart';
import 'package:cinemax/features/homeScreen/widgets/recomend_movie.dart';
import 'package:cinemax/features/homeScreen/widgets/search_bar.dart';
import 'package:cinemax/features/homeScreen/widgets/today_movie_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedCategory = 0;

  final List<String> categories = ['All', 'Comedy', 'Animation', 'Documentary'];

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
          return SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchBar(),
                SizedBox(height: 25.h),
                Categories(categories: categories),

                SizedBox(height: 25.h),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 18.h),

                        TodayMovie(movie: state.movies[0]),

                        SizedBox(height: 65.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recommend for you',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'See All',
                              style: TextStyle(
                                color: const Color(0xFF18C8D7),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        // Recomended MOVIES
                        SizedBox(
                          height: 215.h,

                          child: ListView(
                            scrollDirection: Axis.horizontal,

                            children: [
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                // state.movies.length,
                                itemBuilder: (context, index) {
                                  final movie = state.movies[index];
                                  return RecommendMovie(
                                    image: movie.posterUrl,
                                    title: movie.title,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox(child: Center(child: Text('No movies found')));
      },
    );
  }
}
