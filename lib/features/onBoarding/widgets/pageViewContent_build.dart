// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pageviewcontent extends StatelessWidget {
  const Pageviewcontent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    this.imgWidth,
    this.fontSize,
    this.widgetChild,
  });

  final String imagePath;
  final String title;
  final String subTitle;
  final double? fontSize;
  final double? imgWidth;
  final Widget? widgetChild;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          fit: BoxFit.cover,
          imagePath,
          colorBlendMode: BlendMode.modulate,
          width: imgWidth ?? MediaQuery.of(context).size.height * 0.35,
          height: MediaQuery.of(context).size.height * 0.45,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15.w, 22.h, 15.w, 1.h),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: fontSize ?? 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(35.w, 5.h, 35.w, 1.h),
            child: Column(
              children: [
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                widgetChild ?? Text(' '),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
