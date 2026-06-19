import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchNavbar extends StatelessWidget {
  const SearchNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.maybePop(context),
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
              ),
            ),
          ),
        ),
        Text('Search', style: TextStyles.font18SemiBold),
        SizedBox(width: 40.w),
      ],
    );
  }
}
