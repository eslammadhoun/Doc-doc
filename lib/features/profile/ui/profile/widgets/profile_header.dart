import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 192.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(height: 192.h, color: ColorsManager.mainBlue),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.maybePop(context),
                    child: SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svgs/Chevron-left.svg',
                          width: 24.w,
                          height: 24.h,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text('Profile', style: TextStyles.font18SemiBoldWhite),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.settingsScreen),
                    child: SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svgs/setting-2.svg',
                          width: 24.w,
                          height: 24.h,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
