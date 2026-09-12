import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: const Color(0xFF1F1D2B),

        borderRadius: BorderRadius.circular(12.r),

        border: Border.all(color: const Color(0xFF292735), width: 1),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ---------------------------------------------------------
          // SECTION TITLE
          // ---------------------------------------------------------
          Padding(
            padding: EdgeInsets.only(left: 12.w, top: 14.h, bottom: 7.h),

            child: Text(
              title,

              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // ---------------------------------------------------------
          // ITEMS
          // ---------------------------------------------------------
          ...children,

          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
