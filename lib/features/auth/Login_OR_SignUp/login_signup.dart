import 'package:cinemax/core/utils/colors.dart';
import 'package:cinemax/core/widgets/main_button.dart';
import 'package:cinemax/features/auth/login/login.dart';
import 'package:cinemax/features/auth/signUp/sign_up.dart';
import 'package:cinemax/features/auth/widgets/sign_up_ui_dividor.dart';
import 'package:cinemax/features/auth/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginOrSignUp extends StatelessWidget {
  const LoginOrSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100.h),
          Image(
            image: AssetImage('assets/images/logo.png'),
            width: 150.w,
            height: 150.h,
          ),
          Text(
            'Enter your registered\nPhone number to sign up',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
          ),
          SizedBox(height: 50.h),
          MainButton(
            text: 'Sign up',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            },
          ),
          SizedBox(height: 35.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'I already have an account? ',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          SignUpWithDividor(),
          SizedBox(height: 35.h),
          SocialButtons(),
        ],
      ),
    );
  }
}
