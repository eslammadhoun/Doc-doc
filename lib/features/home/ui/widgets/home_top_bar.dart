import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello,Eslam!', style: TextStyles.font18Bold),
            verticalSpace(2),
            Text('How Are you Today?', style: TextStyles.font13RegularGrey),
          ],
        ),
        InkWell(
          onTap: () => print('Tap!!!'),
          child: Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.lighterGrey,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/notifications_icon.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
