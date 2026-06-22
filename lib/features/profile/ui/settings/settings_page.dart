import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/widgets/logout_dialog.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/widgets/settings_menu_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildNavbar(context),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ListView(
                  children: [
                    SizedBox(height: 20.h),
                    SettingsMenuItem(
                      iconPath: 'assets/svgs/notification.svg',
                      title: 'Notification',
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.notificationSettingsScreen,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SettingsMenuItem(
                      iconPath: 'assets/svgs/message-question.svg',
                      title: 'FAQ',
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.faqScreen),
                    ),
                    SizedBox(height: 12.h),
                    SettingsMenuItem(
                      iconPath: 'assets/svgs/lock.svg',
                      title: 'Security',
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.securityScreen),
                    ),
                    SizedBox(height: 12.h),
                    SettingsMenuItem(
                      iconPath: 'assets/svgs/logout.svg',
                      title: 'Logout',
                      isDestructive: true,
                      onTap: () => showLogoutDialog(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: ColorsManager.lighterGrey),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/Chevron-left.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.darkBlue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Text('Setting', style: TextStyles.font18SemiBoldNearBlack),
          SizedBox(width: 40.w, height: 40.h),
        ],
      ),
    );
  }
}
