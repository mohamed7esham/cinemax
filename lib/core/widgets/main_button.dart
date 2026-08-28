// ignore_for_file: non_constant_identifier_names

import 'package:cinemax/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Change to customButton
class MainButton extends StatelessWidget {
  final dynamic onPressed;
  final String text;
  final Color? textColor;
  final double? height;
  final double width;
  final double? radius;
  final Color? buttonColor;
  final double? r_l_padding;
  const MainButton({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.height,
    this.width = double.infinity,
    this.radius,
    this.buttonColor,
    this.r_l_padding = 24,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        r_l_padding ?? 15.w,
        10.h,
        r_l_padding ?? 15.w,
        0.h,
      ),
      child: MaterialButton(
        elevation: 0, // Remove elevation or shadows button
        minWidth: width,
        height: height ?? 56.h,
        onPressed: onPressed,
        color: buttonColor ?? mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 32.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.sp,
              color: textColor ?? Colors.white,
              // fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
