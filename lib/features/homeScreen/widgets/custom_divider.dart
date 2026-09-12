import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 46.w, right: 12.w),

      child: Divider(height: 1, thickness: 0.5, color: const Color(0xFF292735)),
    );
  }
}
