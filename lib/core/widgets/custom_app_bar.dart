import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF211F2D),
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,

      leading: Padding(
        padding: EdgeInsets.only(left: 36.w),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 32.w,
            height: 32.w,
            decoration: const BoxDecoration(
              color: Color(0xFF292736),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.chevron_left, color: Colors.white, size: 24.sp),
          ),
        ),
      ),

      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
