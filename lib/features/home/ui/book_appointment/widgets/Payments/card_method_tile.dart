import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardMethodTile extends StatelessWidget {
  final String iconAsset;
  final String label;
  final bool showDivider;
  final VoidCallback onTap;

  const CardMethodTile({
    super.key,
    required this.iconAsset,
    required this.label,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          border: showDivider
              ? Border(bottom: BorderSide(color: ColorsManager.lighterGrey))
              : null,
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconAsset, width: 24.r, height: 24.r),
            horizontalSpace(8),
            Expanded(
              child: Text(label, style: TextStyles.font14RegularDarkBlue),
            ),
            Transform.rotate(
              angle: -1.5708,
              child: SvgPicture.asset(
                'assets/svgs/Chevron-left.svg',
                width: 16.r,
                height: 16.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
