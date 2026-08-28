import 'package:cinemax/features/onBoarding/widgets/pageViewContent_build.dart';
import 'package:flutter/material.dart';

class Pageviewcontent1 extends StatelessWidget {
  const Pageviewcontent1({super.key});

  @override
  Widget build(BuildContext context) {
    return Pageviewcontent(
      imagePath: 'assets/images/onBoardingImg1.png',
      title: 'Lorem ipsum dolor sit amet consecteur esplicit',
      subTitle:
          'lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    );
  }
}
