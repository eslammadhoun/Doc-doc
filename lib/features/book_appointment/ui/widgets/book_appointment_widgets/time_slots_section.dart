import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/logic/book_appointment_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSlotsSection extends StatelessWidget {
  const TimeSlotsSection({super.key});

  static const List<String> _timeSlots = [
    '08.00 AM',
    '08.30 AM',
    '09.00 AM',
    '09.30 AM',
    '10.00 AM',
    '11.00 AM',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<BookAppointmentCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Available time', style: TextStyles.font16SemiBoldDarkBlue),
            verticalSpace(16),
            Column(
              children: List.generate(
                (_timeSlots.length / 2).ceil(),
                (rowIndex) {
                  final leftIndex = rowIndex * 2;
                  final rightIndex = leftIndex + 1;
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: rowIndex < (_timeSlots.length / 2).ceil() - 1
                          ? 12.h
                          : 0,
                    ),
                    child: Row(
                      children: [
                        _TimeSlotCard(
                          label: _timeSlots[leftIndex],
                          isSelected: state.selectedTimeIndex == leftIndex,
                          onTap: () => cubit.selectTime(leftIndex),
                        ),
                        horizontalSpace(12),
                        if (rightIndex < _timeSlots.length)
                          _TimeSlotCard(
                            label: _timeSlots[rightIndex],
                            isSelected: state.selectedTimeIndex == rightIndex,
                            onTap: () => cubit.selectTime(rightIndex),
                          ),
                      ],
                    ),
                  );
                },
              ),
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
            color: isSelected ? ColorsManager.mainBlue : ColorsManager.surfaceGrey,
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
