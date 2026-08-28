import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpWithDividor extends StatelessWidget {
  const SignUpWithDividor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[700],
            thickness: 0.3,
            indent: 65.w,
            endIndent: 10.w,
          ),
        ),
        Text(
          'Or sign up with',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[700],
            thickness: 0.3,
            indent: 10.w,
            endIndent: 65.w,
          ),
        ),
      ],
    );
  }
}
