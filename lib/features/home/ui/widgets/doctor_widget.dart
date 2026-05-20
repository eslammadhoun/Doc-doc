import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: const EdgeInsets.all(8),
      width: 343.w,
      height: 126.h,
      child: Row(
        children: [
          Container(
            width: 110.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: ColorsManager.darkBlue,
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12.r),
              child: Image.asset(
                'assets/images/doctor_1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dr. Randy Wigham', style: TextStyles.font16BoldDarkBlue),
              verticalSpace(8),
              Text(
                'General | RSUD Gatot Subroto',
                style: TextStyles.font11MediumGrey,
              ),
              verticalSpace(12),
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/magic-star.svg', width: 18.5.w),
                  horizontalSpace(3),
                  Text(
                    '4.8 (4,279 reviews)',
                    style: TextStyles.font12MediumGray,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
