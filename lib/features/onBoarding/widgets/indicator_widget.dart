import 'package:cinemax/features/onBoarding/widgets/indicator_build.dart';
import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required int numPages,
    required int currentPage,
  }) : _numPages = numPages,
       _currentPage = currentPage;

  final int _numPages;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Indicator(
          numPages: _numPages,
          currentPage: _currentPage,
        ), //indicator widget
      ],
    );
  }
}
