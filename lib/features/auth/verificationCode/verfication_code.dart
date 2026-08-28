import 'package:cinemax/core/utils/colors.dart';
import 'package:cinemax/core/widgets/custom_app_bar.dart';
import 'package:cinemax/core/widgets/main_button.dart';
import 'package:cinemax/features/auth/createNewPassword/create_new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatelessWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    const cardBackground = Color(0xFF252534);

    // Default box style
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 64.h,
      textStyle: TextStyle(
        fontSize: 22.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    // Focused box style (cyan border)
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: mainColor, width: 1.5.w),
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Text(
                'Verifying Your Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14.sp,
                        height: 1.5.h,
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'We have just sent you 4 digit code via your\nemail ',
                        ),
                        TextSpan(
                          text: email,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              // All 4 PIN boxes handled in a single widget
              Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                onCompleted: (pin) {
                  // Auto-triggers when all 4 digits are typed
                  debugPrint('OTP Completed: $pin');
                },
              ),
              SizedBox(height: 40.h),
              MainButton(
                text: 'Continue',
                r_l_padding: 0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateNewPasswordScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Didn’t receive code? ',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Resend logic
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
