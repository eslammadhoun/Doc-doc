import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalRecordEntryData {
  final String date;
  final String title;
  final List<String> details;

  const MedicalRecordEntryData({
    required this.date,
    required this.title,
    this.details = const [],
  });
}

class MedicalRecordEntry extends StatelessWidget {
  final MedicalRecordEntryData data;

  const MedicalRecordEntry({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: data.details.isEmpty
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 56.w,
          child: Text(
            data.date,
            style: TextStyles.font14RegularDarkBlue.copyWith(
              color: ColorsManager.grey,
              height: 1.8,
              letterSpacing: 0.2,
            ),
          ),
        ),
        SizedBox(width: 24.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: TextStyles.font14MediumDarkBlue.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (data.details.isNotEmpty) ...[
                SizedBox(height: 8.h),
                ...data.details.map(
                  (detail) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Opacity(
                      opacity: 0.7,
                      child: Text(
                        detail,
                        style: TextStyles.font12RegularGrey.copyWith(
                          color: ColorsManager.darkBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
