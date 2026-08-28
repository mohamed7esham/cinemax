import 'package:cinemax/core/widgets/custom_app_bar.dart';
import 'package:cinemax/core/widgets/main_button.dart';
import 'package:cinemax/features/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 43.h),
              Center(
                child: Text(
                  "Create new password",
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
                  'Enter your new password',
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
                label: 'New Password',
                hintText: '•••••••••••••••',
                controller: newPasswordController,
                obscureText: !isNewPasswordVisible,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isNewPasswordVisible = !isNewPasswordVisible;
                    });
                  },
                  child: Icon(
                    isNewPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: const Color(0xFF858291),
                    size: 22.sp,
                  ),
                ),
              ),
              SizedBox(height: 27.h),
              CustomTextField(
                label: 'Confirm Password',
                hintText: '•••••••••••••••',
                controller: confirmPasswordController,
                obscureText: !isConfirmPasswordVisible,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                  child: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: const Color(0xFF858291),
                    size: 22.sp,
                  ),
                ),
              ),
              SizedBox(height: 37.h),
              SizedBox(
                child: MainButton(
                  text: 'Reset',
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
