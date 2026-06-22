import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconPath;
  final Color iconBackgroundColor;
  final String title;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    required this.iconPath,
    required this.iconBackgroundColor,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorsManager.lighterGrey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: SvgPicture.asset(
                iconPath,
                width: 24.w,
                height: 24.h,
              ),
            ),
            SizedBox(width: 13.w),
            Text(title, style: TextStyles.font14RegularDarkBlue),
          ],
        ),
      ),
    );
  }
}
