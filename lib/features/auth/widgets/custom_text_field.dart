import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,

      style: TextStyle(color: const Color(0xFF8C8996), fontSize: 14.sp),

      cursorColor: const Color(0xFF16C6D5),

      decoration: InputDecoration(
        labelText: label,

        labelStyle: TextStyle(color: Colors.white, fontSize: 12.sp),

        floatingLabelStyle: TextStyle(color: Colors.white, fontSize: 12.sp),

        hintText: hintText,

        hintStyle: TextStyle(color: const Color(0xFF8C8996), fontSize: 14.sp),

        // Space between label and text
        floatingLabelBehavior: FloatingLabelBehavior.always,

        filled: true,
        fillColor: const Color(0xFF211F2D),

        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),

        // Normal border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.r),
          borderSide: const BorderSide(color: Color(0xFF2B2938), width: 1),
        ),

        // When focused
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.r),
          borderSide: const BorderSide(color: Color(0xFF2B2938), width: 1),
        ),

        // Label background
        suffixIcon: suffixIcon,
      ),
    );
  }
}
