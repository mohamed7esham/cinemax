import 'package:cinemax/features/homeScreen/Controller/home_cubit.dart';
import 'package:cinemax/features/homeScreen/widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.selectedBottomNav != current.selectedBottomNav,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 28.0),
          child: Container(
            height: 70.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: const BoxDecoration(color: Color(0xFF1F1D2B)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: state.selectedBottomNav == 0,
                  onTap: () {
                    context.read<HomeCubit>().changeBottomNav(0);
                  },
                ),

                NavItem(
                  icon: Icons.search,
                  label: 'Search',
                  selected: state.selectedBottomNav == 1,
                  onTap: () {
                    context.read<HomeCubit>().changeBottomNav(1);
                  },
                ),

                NavItem(
                  icon: Icons.download_outlined,
                  label: '',
                  selected: state.selectedBottomNav == 2,
                  onTap: () {
                    context.read<HomeCubit>().changeBottomNav(2);
                  },
                ),

                NavItem(
                  icon: Icons.person,
                  label: '',
                  selected: state.selectedBottomNav == 3,
                  onTap: () {
                    context.read<HomeCubit>().changeBottomNav(3);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
