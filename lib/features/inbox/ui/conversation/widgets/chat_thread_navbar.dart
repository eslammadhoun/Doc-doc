import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatThreadNavbar extends StatelessWidget {
  final String name;
  final String status;

  const ChatThreadNavbar({
    super.key,
    required this.name,
    this.status = 'Online',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 1.5.r,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavButton(
            onTap: () => Navigator.maybePop(context),
            child: SvgPicture.asset(
              'assets/svgs/Chevron-left.svg',
              width: 24.w,
              height: 24.h,
            ),
          ),
          Column(
            children: [
              Text(name, style: TextStyles.font16SemiBoldDarkBlue),
              Text(status, style: TextStyles.font12RegularTextSecondary),
            ],
          ),
          _NavButton(
            onTap: () {},
            child: SvgPicture.asset('assets/svgs/video.svg', width: 24.w),
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
