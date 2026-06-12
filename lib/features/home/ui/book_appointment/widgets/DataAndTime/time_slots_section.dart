import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSlotsSection extends StatelessWidget {
  const TimeSlotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<BookAppointmentCubit>();
        final timeSlots = state.timeSlots;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Available time', style: TextStyles.font16SemiBoldDarkBlue),
            verticalSpace(16),
            Column(
              children: List.generate((timeSlots.length / 2).ceil(), (
                rowIndex,
              ) {
                final leftIndex = rowIndex * 2;
                final rightIndex = leftIndex + 1;
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: rowIndex < (timeSlots.length / 2).ceil() - 1
                        ? 12.h
                        : 0,
                  ),
                  child: Row(
                    children: [
                      _TimeSlotCard(
                        label: timeSlots[leftIndex],
                        isSelected: state.selectedTimeIndex == leftIndex,
                        onTap: () => cubit.selectTime(leftIndex),
                      ),
                      horizontalSpace(12),
                      if (rightIndex < timeSlots.length)
                        _TimeSlotCard(
                          label: timeSlots[rightIndex],
                          isSelected: state.selectedTimeIndex == rightIndex,
                          onTap: () => cubit.selectTime(rightIndex),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}

class _TimeSlotCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TimeSlotCard({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.mainBlue
                : ColorsManager.surfaceGrey,
            borderRadius: BorderRadius.circular(14.r),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: isSelected
                ? TextStyles.font14MediumWhite
                : TextStyles.font14MediumLightGrey,
          ),
        ),
      ),
    );
  }
}
