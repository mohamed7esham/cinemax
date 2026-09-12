import 'package:cinemax/core/network/test_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,

      child: OutlinedButton(
        onPressed: () async {
          await testApi();
        },

        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF18C8D7), width: 1),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.r),
          ),

          backgroundColor: Colors.transparent,
        ),

        child: Text(
          'Log Out',

          style: TextStyle(
            color: const Color(0xFF18C8D7),
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
