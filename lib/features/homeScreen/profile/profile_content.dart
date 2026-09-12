import 'package:cinemax/features/homeScreen/widgets/custom_divider.dart';
import 'package:cinemax/features/homeScreen/widgets/logout_button.dart';
import 'package:cinemax/features/homeScreen/widgets/premium_banner.dart';
import 'package:cinemax/features/homeScreen/widgets/profile_card.dart';
import 'package:cinemax/features/homeScreen/widgets/section_container.dart';
import 'package:cinemax/features/homeScreen/widgets/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,

      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 12.h),

            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ProfileCard(),

                  SizedBox(height: 16.h),

                  PremiumBanner(),

                  SizedBox(height: 17.h),

                  SectionContainer(
                    title: 'Account',
                    children: [
                      SettingItem(
                        icon: Icons.person_outline,
                        title: 'Member',
                        onTap: () {},
                      ),

                      CustomDivider(),

                      SettingItem(
                        icon: Icons.lock_outline,
                        title: 'Change Password',
                        onTap: () {},
                      ),
                    ],
                  ),

                  SizedBox(height: 17.h),

                  SectionContainer(
                    title: 'General',
                    children: [
                      SettingItem(
                        icon: Icons.notifications,
                        title: 'Notification',
                        onTap: () {},
                      ),

                      CustomDivider(),

                      SettingItem(
                        icon: Icons.language,
                        title: 'Language',
                        onTap: () {},
                      ),

                      CustomDivider(),

                      SettingItem(
                        icon: Icons.flag,
                        title: 'Country',
                        onTap: () {},
                      ),

                      CustomDivider(),

                      SettingItem(
                        icon: Icons.delete,
                        title: 'Clear Cache',
                        onTap: () {},
                      ),
                    ],
                  ),

                  SizedBox(height: 17.h),

                  SectionContainer(
                    title: 'More',
                    children: [
                      SettingItem(
                        icon: Icons.shield,
                        title: 'Legal and Policies',
                        onTap: () {},
                      ),

                      CustomDivider(),

                      SettingItem(
                        icon: Icons.help_outline,
                        title: 'Help & Feedback',
                        onTap: () {},
                      ),

                      CustomDivider(),

                      SettingItem(
                        icon: Icons.info,
                        title: 'About Us',
                        onTap: () {},
                      ),
                    ],
                  ),

                  SizedBox(height: 28.h),

                  LogoutButton(),

                  SizedBox(height: 25.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
