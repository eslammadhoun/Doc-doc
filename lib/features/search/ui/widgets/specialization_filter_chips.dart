import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationFilterChips extends StatelessWidget {
  final List<String> specializations;
  final String? selectedFilter;
  final ValueChanged<String?> onFilterSelected;

  const SpecializationFilterChips({
    super.key,
    required this.specializations,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: specializations.length + 1,
        separatorBuilder: (_, _) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _FilterChip(
              label: 'All',
              isSelected: selectedFilter == null,
              onTap: () => onFilterSelected(null),
            );
          }
          final specialization = specializations[index - 1];
          return _FilterChip(
            label: specialization,
            isSelected: selectedFilter == specialization,
            onTap: () => onFilterSelected(specialization),
          );
        },
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.mainBlue
              : ColorsManager.surfaceGrey,
          borderRadius: BorderRadius.circular(24.r),
          border: isSelected
              ? null
              : Border.all(color: ColorsManager.surfaceGrey, width: 2),
        ),
        child: Text(
          label,
          style: isSelected
              ? TextStyles.font14RegularWhite
              : TextStyles.font14RegularLightGrey,
        ),
      ),
    );
  }
}
