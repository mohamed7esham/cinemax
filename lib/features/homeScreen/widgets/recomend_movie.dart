import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendMovie extends StatelessWidget {
  const RecommendMovie({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.w,

      margin: EdgeInsets.only(right: 10.w),

      decoration: BoxDecoration(
        color: const Color(0xFF292735),

        borderRadius: BorderRadius.circular(10.r),
      ),

      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Stack(
            children: [
              Image.asset(
                image,

                width: 122.w,
                height: 162.h,

                fit: BoxFit.cover,
              ),

              // RATING
              Positioned(
                top: 8.h,
                right: 7.w,

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),

                  decoration: BoxDecoration(
                    color: const Color(0xFF252330),

                    borderRadius: BorderRadius.circular(10.r),
                  ),

                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 13.sp),

                      SizedBox(width: 2.w),

                      Text(
                        '4.5',

                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(8.w, 8.h, 5.w, 2.h),

            child: Text(
              title,

              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),

            child: Text(
              'Action',

              style: TextStyle(color: const Color(0xFF85828F), fontSize: 10.sp),
            ),
          ),
        ],
      ),
    );
  }
}
