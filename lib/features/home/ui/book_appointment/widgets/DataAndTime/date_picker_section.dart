import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DatePickerSection extends StatelessWidget {
  const DatePickerSection({super.key});

  static const int _totalDays = 14;
  static const int _visibleDays = 5;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<BookAppointmentCubit>();
        final today = DateTime.now();
        final dates = List.generate(
          _totalDays,
          (i) => today.add(Duration(days: i)),
        );
        final visibleDates = dates.sublist(
          state.pageStartIndex,
          state.pageStartIndex + _visibleDays,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select Date', style: TextStyles.font16SemiBoldDarkBlue),
                Text('Set Manual', style: TextStyles.font12MediumBlue),
              ],
            ),
            verticalSpace(16),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: cubit.navigateDaysLeft,
                    child: Icon(
                      Icons.chevron_left,
                      size: 24.r,
                      color: state.pageStartIndex > 0
                          ? ColorsManager.darkBlue
                          : ColorsManager.lightGrey,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: visibleDates.asMap().entries.map((entry) {
                        final absoluteIndex = state.pageStartIndex + entry.key;
                        final date = entry.value;
                        final isSelected =
                            state.selectedDateIndex == absoluteIndex;
                        return GestureDetector(
                          onTap: () => cubit.selectDate(absoluteIndex),
                          child: _DateCard(date: date, isSelected: isSelected),
                        );
                      }).toList(),
                    ),
                  ),
                  GestureDetector(
                    onTap: cubit.navigateDaysRight,
                    child: Icon(
                      Icons.chevron_right,
                      size: 24.r,
                      color: state.pageStartIndex < _totalDays - _visibleDays
                          ? ColorsManager.darkBlue
                          : ColorsManager.lightGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DateCard extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  const _DateCard({required this.date, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isSelected
          ? EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h)
          : EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.mainBlue : ColorsManager.surfaceGrey,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat('EEE').format(date),
            style: isSelected
                ? TextStyles.font14SemiBoldWhite
                : TextStyles.font12MediumLightGrey,
          ),
          Text(
            DateFormat('dd').format(date),
            style: isSelected
                ? TextStyles.font14SemiBoldWhite
                : TextStyles.font12MediumLightGrey,
          ),
        ],
      ),
    );
  }
}
