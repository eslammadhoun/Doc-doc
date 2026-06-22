import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
    required this.isExpanded,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: TextStyles.font14RegularDarkBlue,
                  ),
                ),
                SizedBox(width: 5.w),
                RotatedBox(
                  quarterTurns: isExpanded ? 1 : 3,
                  child: SvgPicture.asset(
                    'assets/svgs/Chevron-left.svg',
                    width: 16.w,
                    height: 16.h,
                    colorFilter: const ColorFilter.mode(
                      ColorsManager.darkBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            if (isExpanded) ...[
              SizedBox(height: 8.h),
              Text(
                answer,
                style: TextStyles.font10RegularGrey.copyWith(
                  color: ColorsManager.grey,
                  height: 1.5,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
