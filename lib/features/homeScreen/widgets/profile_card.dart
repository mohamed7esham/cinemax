import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,

      padding: EdgeInsets.symmetric(horizontal: 10.w),

      decoration: BoxDecoration(
        color: const Color(0xFF1F1D2B),

        borderRadius: BorderRadius.circular(12.r),

        border: Border.all(color: const Color(0xFF292735), width: 1),
      ),

      child: Row(
        children: [
          // ---------------------------------------------------------
          // PROFILE IMAGE
          // ---------------------------------------------------------
          Container(
            width: 40.w,
            height: 40.w,

            decoration: const BoxDecoration(shape: BoxShape.circle),

            clipBehavior: Clip.antiAlias,

            child: Image.asset(
              'assets/images/profile.jpg',

              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF292A3B),

                  child: Icon(Icons.person, color: Colors.white, size: 23.sp),
                );
              },
            ),
          ),

          SizedBox(width: 10.w),

          // ---------------------------------------------------------
          // NAME + EMAIL
          // ---------------------------------------------------------
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Tiffany',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  'Tiffanyyearsey@gmail.com',

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    color: const Color(0xFF898795),
                    fontSize: 9.sp,
                  ),
                ),
              ],
            ),
          ),

          // ---------------------------------------------------------
          // EDIT BUTTON
          // ---------------------------------------------------------
          Icon(
            Icons.edit_outlined,

            color: const Color(0xFF18C8D7),

            size: 18.sp,
          ),
        ],
      ),
    );
  }
}
