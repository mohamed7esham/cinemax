import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF8B8994), size: 15.sp),

        SizedBox(width: 6.w),

        Text(
          text,

          style: TextStyle(color: const Color(0xFF8B8994), fontSize: 11.sp),
        ),
      ],
    );
  }
}
