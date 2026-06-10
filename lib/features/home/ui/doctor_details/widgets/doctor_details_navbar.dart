import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsNavbar extends StatelessWidget {
  final String doctorName;

  const DoctorDetailsNavbar({super.key, required this.doctorName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavButton(
          onTap: () => Navigator.pop(context),
          icon: Icons.chevron_left,
        ),
        Expanded(
          child: Center(
            child: Text(
              doctorName,
              style: TextStyles.font18SemiBold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const _NavButton(icon: Icons.more_horiz),
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _NavButton({required this.icon, this.onTap});

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
        child: Center(
          child: Icon(icon, color: ColorsManager.darkBlue, size: 24.r),
        ),
      ),
    );
  }
}
