import 'package:cinemax/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Indicator extends StatelessWidget {
  final int numPages;
  final int currentPage;

  const Indicator({
    super.key,
    required this.numPages,
    required this.currentPage,
  });

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.h,
      width: isActive ? 32.w : 11.w,
      decoration: BoxDecoration(
        color: isActive ? mainColor : const Color(0xFFe9e9e9),
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
    );
  }
}
