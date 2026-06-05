import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/image_widget.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearbyDoctorCard extends StatelessWidget {
  final DoctorModel? doctor;

  const NearbyDoctorCard({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32.h, left: 16.w, right: 16.w),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: 74.w,
              height: 74.h,
              child: doctor?.photo != null && doctor!.photo!.isNotEmpty
                  ? AppCachedImage(imageUrl: doctor!.photo!)
                  : Image.asset(
                      'assets/images/doctor_1.png',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor?.name ?? 'Dr. Randy Wigham',
                  style: TextStyles.font16BoldDarkBlue,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(8),
                Row(
                  children: [
                    Text(
                      doctor?.specialization?.name ?? 'General',
                      style: TextStyles.font12MediumTextSecondary,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        '|',
                        style: TextStyles.font12MediumTextSecondary,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        doctor?.city?.name ?? 'RSUD Gatot Subroto',
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
    );
  }
}
