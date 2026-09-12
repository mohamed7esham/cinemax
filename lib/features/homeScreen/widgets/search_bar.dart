import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFF292735),
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 16.w),

            const Icon(Icons.search, color: Color(0xFF92909D), size: 20),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                'Search a title..',
                style: TextStyle(color: Color(0xFF92909D), fontSize: 14.sp),
              ),
            ),

            Container(width: 1.w, height: 20.h, color: const Color(0xFF5A5865)),

            SizedBox(width: 12.w),

            const Icon(Icons.tune, color: Colors.white, size: 19),

            SizedBox(width: 15.w),
          ],
        ),
      ),
    );
  }
}
