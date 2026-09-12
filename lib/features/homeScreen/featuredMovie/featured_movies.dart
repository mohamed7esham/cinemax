import 'package:cinemax/core/app/block/cubit/movies_cubit.dart';
import 'package:cinemax/core/app/block/cubit/movies_state.dart';
import 'package:cinemax/features/homeScreen/widgets/featured_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedMovies extends StatefulWidget {
  // final List<Movie> movies;

  const FeaturedMovies({super.key});

  @override
  State<FeaturedMovies> createState() => FeaturedMoviesState();
}

class FeaturedMoviesState extends State<FeaturedMovies> {
  final PageController _controller = PageController(viewportFraction: 0.82);

  int currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              SizedBox(
                height: 155.h,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: 5,
                  // state.movies.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    // ignore: unused_local_variable
                    final movie = state.movies[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: FeaturedCard(movie: movie),
                    );
                  },
                ),
              ),

              SizedBox(height: 12.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  // state.movies.length,
                  (index) {
                    final selected = currentPage == index;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: selected ? 24.w : 7.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF16C9D8)
                            : const Color(0xFF24727A),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
