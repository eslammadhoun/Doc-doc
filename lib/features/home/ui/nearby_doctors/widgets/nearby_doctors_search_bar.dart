import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyDoctorsSearchBar extends StatelessWidget {
  const NearbyDoctorsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 50,
                    offset: const Offset(0, -5),
                  ),
                ],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TextFormField(
                style: TextStyles.font12MediumTextSecondary,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyles.font12MediumPlaceholder,
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorsManager.textSecondary,
                    size: 24.r,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 13.h),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          horizontalSpace(8),
          Container(
            width: 46.w,
            height: 46.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 50,
                  offset: const Offset(0, -5),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.tune, color: ColorsManager.mainBlue, size: 24.r),
          ),
        ],
      ),
    );
  }
}
