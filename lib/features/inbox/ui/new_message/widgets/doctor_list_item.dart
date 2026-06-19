import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListItem extends StatelessWidget {
  final String name;
  final String specialization;
  final String imagePath;
  final bool showDivider;

  const DoctorListItem({
    super.key,
    required this.name,
    required this.specialization,
    required this.imagePath,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          border: showDivider
              ? Border(bottom: BorderSide(color: ColorsManager.lighterGrey))
              : null,
        ),
        child: Row(
          children: [
            ClipOval(
              child: SizedBox(
                width: 50.w,
                height: 50.h,
                child: AppCachedImage(
                  imageUrl: imagePath,
                  memCacheHeight: 50,
                  memCacheWidth: 50,
                ),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyles.font14SemiBoldDarkBlue),
                  verticalSpace(4),
                  Text(
                    specialization,
                    style: TextStyles.font10RegularTextSecondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
