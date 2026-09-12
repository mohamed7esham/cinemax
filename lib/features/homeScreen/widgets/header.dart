import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(28.w, 18.h, 28.w, 0),
      child: Row(
        children: [
          Container(
            width: 42.w,
            height: 42.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: ClipOval(
              child: Image.network(
                'https://i.pravatar.cc/150?img=12',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Smith',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  "Let's stream your favorite movie",
                  style: TextStyle(color: Color(0xFF92909D), fontSize: 12.sp),
                ),
              ],
            ),
          ),

          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: const Color(0xFF292735),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: const Icon(Icons.favorite, color: Colors.red, size: 21),
          ),
        ],
      ),
    );
  }
}
