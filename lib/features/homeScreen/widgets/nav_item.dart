import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(
          horizontal: selected ? 17.w : 12.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF292A3B) : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 21,
              color: selected
                  ? const Color(0xFF18C8D7)
                  : const Color(0xFF898795),
            ),

            if (selected && label.isNotEmpty) ...[
              SizedBox(width: 7.w),

              Text(
                label,
                style: TextStyle(
                  color: Color(0xFF18C8D7),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
