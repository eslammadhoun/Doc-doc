import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -5.h),
              blurRadius: 8.r,
              color: const Color(0x0A000000),
            ),
          ],
        ),
        padding: EdgeInsets.all(8.r),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: SizedBox(
                width: 110.w,
                height: 110.h,
                child: AppCachedImage(
                  imageUrl: doctor.photo ?? '',
                  memCacheWidth: 110.w.round(),
                  memCacheHeight: 110.h.round(),
                ),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name ?? '',
                    style: TextStyles.font16BoldDarkBlue,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          doctor.specialization?.name ?? '',
                          style: TextStyles.font12MediumTextSecondary,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          '|',
                          style: TextStyles.font12MediumTextSecondary,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          doctor.city?.name ?? '',
                          style: TextStyles.font12MediumTextSecondary,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(12),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/magic-star.svg',
                        width: 16.w,
                        height: 16.h,
                      ),
                      horizontalSpace(4),
                      Text(
                        '4.8 (4,279 reviews)',
                        style: TextStyles.font12MediumTextSecondary,
                      ),
                    ],
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
