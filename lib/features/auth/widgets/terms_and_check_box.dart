import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Retained for .w, .r, .sp extensions

class TermsAndConditionsCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;

  const TermsAndConditionsCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.onTermsTap,
    this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onChanged(!isChecked),
          child: Container(
            width: 23.w,
            height: 23.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: const Color(0xFF858291), width: 1.5),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: isChecked
                ? Icon(Icons.check, color: const Color(0xFF12C8D8), size: 18.sp)
                : null,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: const Color(0xFF858291),
                fontSize: 12.sp,
                height: 1.6,
              ),
              children: [
                const TextSpan(text: 'I agree to the '),
                TextSpan(
                  text: 'Terms and Services',
                  style: TextStyle(
                    color: const Color(0xFF12C8D8),
                    fontSize: 12.sp,
                  ),
                  // Add gesture recognizer here if needed for navigation
                ),
                const TextSpan(text: '\nand '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: const Color(0xFF12C8D8),
                    fontSize: 12.sp,
                  ),
                  // Add gesture recognizer here if needed for navigation
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
