import 'package:cinemax/core/widgets/custom_app_bar.dart';
import 'package:cinemax/core/widgets/main_button.dart';
import 'package:cinemax/features/auth/login/login.dart';
import 'package:cinemax/features/auth/widgets/custom_text_field.dart';
import 'package:cinemax/features/auth/widgets/terms_and_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool agreeToTerms = false;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Sign Up'),
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
                  "Let's get started",
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
                  'The latest movies and series\nare here',
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
                label: 'Full Name',
                hintText: 'full name..',
                controller: fullNameController,
              ),
              SizedBox(height: 27.h),
              CustomTextField(
                label: 'Email Address',
                hintText: 'example@gmail.com',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 27.h),
              CustomTextField(
                label: 'Password',
                hintText: '•••••••••••••••',
                controller: passwordController,
                obscureText: !isPasswordVisible,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: Icon(
                    isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: const Color(0xFF858291),
                    size: 22.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              TermsAndConditionsCheckbox(
                isChecked: agreeToTerms,
                onChanged: (newValue) {
                  setState(() {
                    agreeToTerms = newValue;
                  });
                },
              ),
              SizedBox(height: 37.h),
              MainButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
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
