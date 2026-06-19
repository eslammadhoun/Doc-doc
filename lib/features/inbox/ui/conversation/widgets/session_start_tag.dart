import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SessionStartTag extends StatelessWidget {
  const SessionStartTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: ColorsManager.surfaceGrey,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Text('Session Start', style: TextStyles.font10MediumGrey),
      ),
    );
  }
}
