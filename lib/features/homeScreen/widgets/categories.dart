import 'package:cinemax/features/homeScreen/Controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  final List<String> categories;

  const Categories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            'Categories',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        SizedBox(height: 14.h),

        SizedBox(
          height: 40.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    previous.selectedCategory != current.selectedCategory,
                builder: (context, state) {
                  final selected = state.selectedCategory == index;

                  return GestureDetector(
                    onTap: () {
                      context.read<HomeCubit>().selectCategory(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 28.w),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF292A3B)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: selected
                              ? const Color(0xFF18C8D7)
                              : Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
