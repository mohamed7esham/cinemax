import 'package:cinemax/features/homeScreen/Controller/home_cubit.dart';
import 'package:cinemax/features/homeScreen/homeContent/home_content.dart';
import 'package:cinemax/features/homeScreen/profile/profile_content.dart';
import 'package:cinemax/features/homeScreen/search/search_screen.dart';
import 'package:cinemax/features/homeScreen/widgets/custom_bottom_navigation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),

      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            previous.selectedBottomNav != current.selectedBottomNav,

        builder: (context, state) {
          return SafeArea(
            child: IndexedStack(
              index: state.selectedBottomNav,

              children: [
                HomeContent(),

                SearchScreen(),

                DownloadScreen(),

                ProfileScreen(),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1F1D2B),

      child: Center(
        child: Text(
          'Downloads',

          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ),
    );
  }
}
