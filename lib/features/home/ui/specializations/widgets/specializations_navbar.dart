import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationsNavbar extends StatelessWidget {
  const SpecializationsNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorsManager.darkBlue,
              size: 20.r,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Doctor Speciality',
                style: TextStyles.font18SemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
