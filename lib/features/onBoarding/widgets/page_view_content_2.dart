import 'package:cinemax/features/onBoarding/widgets/pageViewContent_build.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pageviewcontent2 extends StatelessWidget {
  const Pageviewcontent2({super.key});

  @override
  Widget build(BuildContext context) {
    return Pageviewcontent(
      imagePath: 'assets/images/onBoardingImg2.png',
      imgWidth: double.infinity,
      title: 'Lorem ipsum dolor sit amet consecteur esplicit',
      fontSize: 28.sp,
      subTitle:
          'lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    );
  }
}
