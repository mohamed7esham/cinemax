import 'package:cinemax/data/models/movie.dart';
import 'package:cinemax/features/homeScreen/widgets/movie_info_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayMovie extends StatelessWidget {
  final Movie movie;
  const TodayMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // POSTER
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
                width: 105.w,
                height: 130.h,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF34313F),
                    child: const Icon(
                      Icons.movie,
                      color: Colors.white,
                      size: 50,
                    ),
                  );
                },
              ),
            ),

            // RATING
            Positioned(
              top: 7.h,
              left: 7.w,

              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),

                decoration: BoxDecoration(
                  color: const Color(0xFF252330),

                  borderRadius: BorderRadius.circular(12.r),
                ),

                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 14.sp),

                    SizedBox(width: 2.w),

                    Text(
                      movie.voteAverage.toStringAsFixed(1),

                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(width: 14.w),

        // MOVIE DETAILS
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // PREMIUM
              Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),

                decoration: BoxDecoration(
                  color: Colors.orange,

                  borderRadius: BorderRadius.circular(5.r),
                ),

                child: Text(
                  'Premium',

                  style: TextStyle(color: Colors.white, fontSize: 9.sp),
                ),
              ),

              SizedBox(height: 10.h),

              // TITLE
              Text(
                movie.title,

                maxLines: 1,
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 10.h),

              MovieInfo(icon: Icons.calendar_month, text: movie.releaseDate),

              SizedBox(height: 8.h),

              MovieInfo(icon: Icons.timer_outlined, text: '148 Minutes'),

              SizedBox(height: 8.h),

              Row(
                children: [
                  Icon(
                    Icons.movie_outlined,
                    color: const Color(0xFF8B8994),
                    size: 15.sp,
                  ),

                  SizedBox(width: 6.w),

                  Text(
                    'Action',

                    style: TextStyle(color: Colors.white, fontSize: 11.sp),
                  ),

                  SizedBox(width: 8.w),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.h,
                    ),

                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF18C8D7)),

                      borderRadius: BorderRadius.circular(3.r),
                    ),

                    child: Text(
                      'PG-13',

                      style: TextStyle(
                        color: const Color(0xFF18C8D7),
                        fontSize: 10.sp,
                      ),
                    ),
                  ),

                  SizedBox(width: 8.w),

                  Flexible(
                    child: Text(
                      '| Movie',

                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
