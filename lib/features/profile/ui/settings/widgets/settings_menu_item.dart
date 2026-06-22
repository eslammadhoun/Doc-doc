import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsMenuItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const SettingsMenuItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorsManager.lighterGrey, width: 1.h),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: isDestructive
                    ? TextStyles.font14RegularDarkBlue.copyWith(
                        color: ColorsManager.secondaryRed,
                      )
                    : TextStyles.font14RegularDarkBlue,
              ),
            ),
            SizedBox(width: 28.w),
            SvgPicture.asset(
              'assets/svgs/chevron-right.svg',
              width: 18.w,
              height: 18.h,
            ),
          ],
        ),
      ),
    );
  }
}
