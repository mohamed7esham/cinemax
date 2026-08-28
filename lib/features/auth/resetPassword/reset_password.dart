import 'package:cinemax/core/widgets/custom_app_bar.dart';
import 'package:cinemax/core/widgets/main_button.dart';
import 'package:cinemax/features/auth/verificationCode/verfication_code.dart';
import 'package:cinemax/features/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 43.h),
              Center(
                child: Text(
                  "Reset Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Center(
                child: Text(
                  'Recover your account password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13.sp,
                    height: 1.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 73.h),
              CustomTextField(
                label: 'Email Address',
                hintText: 'example@gmail.com',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 27.h),
              MainButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationScreen(
                        email: emailController.text, // Passes entered email
                      ),
                    ),
                  );
                },
                r_l_padding: 0,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
