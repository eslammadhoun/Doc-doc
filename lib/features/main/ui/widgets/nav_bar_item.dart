import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatelessWidget {
  final String iconAsset;
  final bool isSelected;
  final bool showBadge;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.iconAsset,
    required this.isSelected,
    required this.onTap,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 40.w,
        height: 40.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              iconAsset,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                isSelected ? ColorsManager.mainBlue : ColorsManager.grey,
                BlendMode.srcIn,
              ),
            ),
            if (showBadge)
              Positioned(
                top: 4.h,
                right: 8.w,
                child: Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: const BoxDecoration(
                    color: ColorsManager.secondaryRed,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
