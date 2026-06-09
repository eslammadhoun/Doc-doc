import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortOptionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool showStarIcon;
  final VoidCallback onTap;

  const SortOptionChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.showStarIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: showStarIcon ? 16.w : 24.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.mainBlue : ColorsManager.surfaceGrey,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showStarIcon) ...[
              Icon(
                Icons.star_rounded,
                size: 19.r,
                color: isSelected ? Colors.white : ColorsManager.inactiveGrey,
              ),
              horizontalSpace(6),
            ],
            Text(
              label,
              style: isSelected
                  ? TextStyles.font14Regular
                  : (showStarIcon
                        ? TextStyles.font14RegularInactiveGrey
                        : TextStyles.font14RegularLightGrey),
            ),
          ],
        ),
      ),
    );
  }
}
