import 'package:cinemax/features/onBoarding/widgets/animated_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  final int currentPage;
  final VoidCallback onPressed;

  const GetStartedButton({
    super.key,
    required this.currentPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 75.w,
        height: 75.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Animated cyan border
            AnimatedBorder(
              currentPage: currentPage,
              size: 72.w,
              strokeWidth: 2.w,
              color: Colors.cyan,
            ),

            // Actual button
            Container(
              width: 52.w,
              height: 52.w,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 18.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
