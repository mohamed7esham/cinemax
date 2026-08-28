import 'package:cinemax/core/utils/colors.dart';
import 'package:cinemax/core/widgets/custom_app_bar.dart';
import 'package:cinemax/core/widgets/main_button.dart';
import 'package:cinemax/features/auth/resetPassword/reset_password.dart';
import 'package:cinemax/features/auth/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Login'),
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
                  "Hi, Tiffany",
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
                  'Welcome back! Please enter\n your details.',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final db = FirebaseFirestore.instance;
                      await db.collection("users").get().then((event) {
                        for (var doc in event.docs) {
                          print(
                            "/////----${doc.id} => ${doc.data()}////--\n//////////////////-----------/////////",
                          );
                        }
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const ResetPasswordScreen(),
                      //   ),
                      // );
                    },
                    child: Text(
                      'Forgot Passowrd?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 37.h),
              SizedBox(
                child: MainButton(
                  text: 'Login',
                  onPressed: () {},
                  r_l_padding: 0,
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
