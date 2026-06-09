import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/logic/doctors_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/widgets/sort_option_chip.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSortSheet extends StatefulWidget {
  const DoctorsSortSheet({super.key});

  @override
  State<DoctorsSortSheet> createState() => _DoctorsSortSheetState();
}

class _DoctorsSortSheetState extends State<DoctorsSortSheet> {
  static const List<String> _ratings = ['All', '5', '4', '3', '2'];

  late List<String> _specialities;
  late String _selectedSpeciality;
  String _selectedRating = _ratings.first;

  @override
  void initState() {
    super.initState();
    _specialities = context.read<DoctorsCubit>().specialities;
    _selectedSpeciality = context.read<DoctorsCubit>().selectedSpeciality;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(8),
            Center(
              child: Container(
                width: 58.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: ColorsManager.searchBarGrey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            verticalSpace(16),
            Center(child: Text('Sort By', style: TextStyles.font18SemiBold)),
            verticalSpace(16),
            Divider(color: ColorsManager.lighterGrey, height: 1.h),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text('Speciality', style: TextStyles.font16BoldDarkBlue),
            ),
            verticalSpace(16),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: _OptionsRow(
                options: _specialities,
                selected: _selectedSpeciality,
                onSelected: (value) =>
                    setState(() => _selectedSpeciality = value),
              ),
            ),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text('Rating', style: TextStyles.font16BoldDarkBlue),
            ),
            verticalSpace(16),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: _OptionsRow(
                options: _ratings,
                selected: _selectedRating,
                showStarIcon: true,
                onSelected: (value) => setState(() => _selectedRating = value),
              ),
            ),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<DoctorsCubit>().sortDoctors(
                      _selectedSpeciality,
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.mainBlue,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text('Done', style: TextStyles.font16SemiBold),
                ),
              ),
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}

class _OptionsRow extends StatelessWidget {
  final List<String> options;
  final String selected;
  final bool showStarIcon;
  final ValueChanged<String> onSelected;

  const _OptionsRow({
    required this.options,
    required this.selected,
    required this.onSelected,
    this.showStarIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final option in options) ...[
            SortOptionChip(
              label: option,
              isSelected: option == selected,
              showStarIcon: showStarIcon,
              onTap: () => onSelected(option),
            ),
            horizontalSpace(12),
          ],
        ],
      ),
    );
  }
}
