import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/doctor_about_section.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/doctor_location_section.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/doctor_reviews_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsTabs extends StatefulWidget {
  final DoctorModel doctor;
  final int initialIndex;

  const DoctorDetailsTabs({
    super.key,
    required this.doctor,
    this.initialIndex = 0,
  });

  @override
  State<DoctorDetailsTabs> createState() => _DoctorDetailsTabsState();
}

class _DoctorDetailsTabsState extends State<DoctorDetailsTabs> {
  static const List<String> _tabs = ['About', 'Location', 'Reviews'];
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(_tabs.length, (index) {
            final bool isSelected = index == _selectedIndex;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isSelected
                            ? ColorsManager.mainBlue
                            : ColorsManager.lighterGrey,
                        width: 2.h,
                      ),
                    ),
                  ),
                  child: Text(
                    _tabs[index],
                    style: isSelected
                        ? TextStyles.font14BoldBlue
                        : TextStyles.font14BoldMediumGrey,
                  ),
                ),
              ),
            );
          }),
        ),
        verticalSpace(32),
        switch (_selectedIndex) {
          0 => DoctorAboutSection(doctor: widget.doctor),
          1 => DoctorLocationSection(doctor: widget.doctor),
          _ => const DoctorReviewsSection(),
        },
      ],
    );
  }
}
