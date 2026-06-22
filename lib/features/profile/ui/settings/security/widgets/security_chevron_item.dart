import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecurityChevronItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SecurityChevronItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.only(top: 12.h, bottom: 16.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorsManager.lighterGrey,
              width: 1.h,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyles.font14RegularDarkBlue,
              ),
            ),
            SizedBox(width: 5.w),
            SvgPicture.asset(
              'assets/svgs/chevron-right.svg',
              width: 16.w,
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
