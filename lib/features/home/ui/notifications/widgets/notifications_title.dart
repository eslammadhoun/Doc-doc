import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsTitle extends StatelessWidget {
  const NotificationsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => context.pop(),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.lighterGrey),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset('assets/svgs/Chevron-left.svg'),
              ),
            ),
          ),
          Text('Notifications', style: TextStyles.font18SemiBold),
          Container(
            width: 51.w,
            height: 27.h,
            padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.5.w),
            decoration: BoxDecoration(
              color: ColorsManager.mainBlue,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Center(
              child: Text('2 NEW', style: TextStyles.font8MediumWhite),
            ),
          ),
        ],
      ),
    );
  }
}
