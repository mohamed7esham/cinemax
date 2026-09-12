import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: SizedBox(
        height: 48.h,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),

          child: Row(
            children: [
              // -----------------------------------------------------
              // ICON CIRCLE
              // -----------------------------------------------------
              Container(
                width: 24.w,
                height: 24.w,

                decoration: const BoxDecoration(
                  color: Color(0xFF292A3B),
                  shape: BoxShape.circle,
                ),

                child: Icon(icon, color: const Color(0xFF898795), size: 14.sp),
              ),

              SizedBox(width: 10.w),

              // -----------------------------------------------------
              // TITLE
              // -----------------------------------------------------
              Expanded(
                child: Text(
                  title,

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // -----------------------------------------------------
              // ARROW
              // -----------------------------------------------------
              Icon(
                Icons.chevron_right,

                color: const Color(0xFF18C8D7),

                size: 21.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
