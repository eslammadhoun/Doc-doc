import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final String imageUrl;
  final VoidCallback? onCancel;
  final VoidCallback? onReschedule;
  final VoidCallback? onMessage;

  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.imageUrl,
    this.onCancel,
    this.onReschedule,
    this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withAlpha(10),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDoctorInfo(),
          verticalSpace(16),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildDoctorInfo() {
    return Container(
      padding: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorsManager.lighterGrey, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 74.w,
            height: 74.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: AppCachedImage(
                imageUrl: imageUrl,
                memCacheWidth: 74.w.round(),
                memCacheHeight: 74.w.round(),
              ),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        doctorName,
                        style: TextStyles.font16BoldDarkBlue,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: onMessage,
                      child: SvgPicture.asset(
                        'assets/svgs/message-text.svg',
                        width: 24.w,
                        height: 24.w,
                        colorFilter: const ColorFilter.mode(
                          ColorsManager.mainBlue,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(4),
                Opacity(
                  opacity: 0.8,
                  child: Text(
                    specialty,
                    style: TextStyles.font12MediumTextSecondary,
                  ),
                ),
                verticalSpace(8),
                Opacity(
                  opacity: 0.8,
                  child: Row(
                    children: [
                      Text(date, style: TextStyles.font12MediumTextSecondary),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          '|',
                          style: TextStyles.font12MediumTextSecondary,
                        ),
                      ),
                      Text(time, style: TextStyles.font12MediumTextSecondary),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: ColorsManager.mainBlue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              minimumSize: Size(0, 38.h),
            ),
            child: Text(
              'Cancel Appointment',
              style: TextStyles.font12SemiBoldBlue,
            ),
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: ElevatedButton(
            onPressed: onReschedule,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.mainBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              minimumSize: Size(0, 38.h),
              elevation: 0,
            ),
            child: Text('Reschedule', style: TextStyles.font12SemiBoldWhite),
          ),
        ),
      ],
    );
  }
}
