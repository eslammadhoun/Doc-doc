import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorInfoHeader extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorInfoHeader({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: SizedBox(
            width: 74.w,
            height: 74.h,
            child: AppCachedImage(
              imageUrl: doctor.photo ?? '',
              memCacheWidth: 74.w.round(),
              memCacheHeight: 74.h.round(),
            ),
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      doctor.name ?? '',
                      style: TextStyles.font16BoldDarkBlue,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SvgPicture.asset('assets/svgs/message-text.svg', width: 24.w),
                ],
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
              verticalSpace(8),
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
    );
  }
}
