import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/profile/ui/medical_record/widgets/medical_record_entry.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalRecordSection extends StatelessWidget {
  final String title;
  final List<MedicalRecordEntryData> entries;

  const MedicalRecordSection({
    super.key,
    required this.title,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font16SemiBoldDarkBlue.copyWith(
            color: ColorsManager.darkBlue,
          ),
        ),
        SizedBox(height: 24.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: entries.length,
          separatorBuilder: (_, _) => SizedBox(height: 12.h),
          itemBuilder: (_, index) => MedicalRecordEntry(
            data: entries[index],
          ),
        ),
      ],
    );
  }
}
