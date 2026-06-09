import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsNavbar extends StatelessWidget {
  final String? specializationName;
  const DoctorsNavbar({super.key, this.specializationName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          _NavButton(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.chevron_left,
              color: ColorsManager.darkBlue,
              size: 24.r,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                specializationName ?? 'Recommendation Doctor',
                style: TextStyles.font18SemiBold,
              ),
            ),
          ),
          _NavButton(
            child: Icon(
              Icons.more_horiz,
              color: ColorsManager.darkBlue,
              size: 24.r,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _NavButton({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorsManager.lighterGrey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(child: child),
      ),
    );
  }
}
