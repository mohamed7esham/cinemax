import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumBanner extends StatelessWidget {
  const PremiumBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.h,

      width: double.infinity,

      decoration: BoxDecoration(
        color: const Color(0xFFFF9215),

        borderRadius: BorderRadius.circular(12.r),
      ),

      clipBehavior: Clip.antiAlias,

      child: Stack(
        children: [
          Positioned(
            right: -35.w,
            top: -35.h,

            child: Container(
              width: 110.w,
              height: 110.w,

              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.10),

                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            right: 30.w,
            bottom: -55.h,

            child: Container(
              width: 120.w,
              height: 120.w,

              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),

                shape: BoxShape.circle,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),

            child: Row(
              children: [
                // PREMIUM ICON
                Container(
                  width: 30.w,
                  height: 30.w,

                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),

                    borderRadius: BorderRadius.circular(6.r),
                  ),

                  child: Icon(
                    Icons.workspace_premium_outlined,

                    color: Colors.white,

                    size: 18.sp,
                  ),
                ),

                SizedBox(width: 9.w),

                // TEXT
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Premium Member',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 3.h),

                    Text(
                      'New movies are coming for you',

                      style: TextStyle(color: Colors.white, fontSize: 9.sp),
                    ),

                    SizedBox(height: 2.h),

                    Text(
                      'Download Now!',

                      style: TextStyle(color: Colors.white, fontSize: 9.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
