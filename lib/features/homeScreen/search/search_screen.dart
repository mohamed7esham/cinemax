import 'package:cinemax/features/homeScreen/widgets/categories.dart';
import 'package:cinemax/features/homeScreen/widgets/recomend_movie.dart';
import 'package:cinemax/features/homeScreen/widgets/search_bar.dart';
import 'package:cinemax/features/homeScreen/widgets/today_movie_search.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchBar(),

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

                  TodayMovie(),

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
                        RecommendMovie(
                          image: 'assets/images/jungle.jpg',
                          title: 'The Jungle Wa...',
                        ),

                        RecommendMovie(
                          image: 'assets/images/life_of_pi.jpg',
                          title: 'Life of PI',
                        ),

                        RecommendMovie(
                          image: 'assets/images/movie3.jpg',
                          title: 'Dot..',
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
}
