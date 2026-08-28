import 'package:cinemax/features/onBoarding/controller/on_boarding_cubit.dart';
import 'package:cinemax/features/onBoarding/controller/on_boarding_state.dart';
import 'package:cinemax/features/onBoarding/widgets/get_started_button.dart';
import 'package:cinemax/features/onBoarding/widgets/indicator_widget.dart';
import 'package:cinemax/features/onBoarding/widgets/page_view_content_1.dart';
import 'package:cinemax/features/onBoarding/widgets/page_view_content_2.dart';
import 'package:cinemax/features/onBoarding/widgets/page_view_content_3.dart';
import 'package:cinemax/features/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 60.h)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    allowImplicitScrolling: true,
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: (int page) {
                      context.read<OnBoardingCubit>().changePage(page);
                    },
                    children: <Widget>[
                      Pageviewcontent1(),
                      Pageviewcontent2(),
                      Pageviewcontent3(),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IndicatorWidget(
                        numPages: state.numPages,
                        currentPage: state.currentPage,
                      ),
                      GetStartedButton(
                        currentPage: state.currentPage,
                        onPressed: () {
                          if (state.isLastPage) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SplashScreen(),
                              ),
                            );
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 40.h),
            ],
          );
        },
      ),
    );
  }
}
