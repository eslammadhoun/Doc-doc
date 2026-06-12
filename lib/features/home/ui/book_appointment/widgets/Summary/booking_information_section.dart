import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_state.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Summary/booking_info_tile.dart';
import 'package:intl/intl.dart';

class BookingInformationSection extends StatelessWidget {
  const BookingInformationSection({super.key});

  static const Map<AppointmentType, String> _typeLabels = {
    AppointmentType.inPerson: 'In Person',
    AppointmentType.videoCall: 'Video Call',
    AppointmentType.phoneCall: 'Phone Call',
  };

  static String _addMinutesToSlot(String slot, int minutes) {
    final parts = slot.split(' ');
    final timeParts = parts[0].split('.');
    final period = parts[1];
    int hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);

    int hour24 = hour % 12;
    if (period == 'PM') hour24 += 12;

    int totalMinutes = hour24 * 60 + minute + minutes;
    totalMinutes %= 24 * 60;

    final newHour24 = totalMinutes ~/ 60;
    final newMinute = totalMinutes % 60;
    final newPeriod = newHour24 >= 12 ? 'PM' : 'AM';
    final newHour12 = newHour24 % 12 == 0 ? 12 : newHour24 % 12;

    return '${newHour12.toString().padLeft(2, '0')}.${newMinute.toString().padLeft(2, '0')} $newPeriod';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Booking Information', style: TextStyles.font16SemiBoldDarkBlue),
        verticalSpace(16),
        BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
          builder: (context, state) {
            final date = DateTime.now().add(
              Duration(days: state.selectedDateIndex),
            );
            final dateLabel = DateFormat('EEEE, dd MMMM yyyy').format(date);
            final startTime = state.timeSlots.isNotEmpty
                ? state.timeSlots[state.selectedTimeIndex]
                : '';
            final endTime = startTime.isNotEmpty
                ? _addMinutesToSlot(startTime, 30)
                : '';

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookingInfoTile(
                  iconAsset: 'assets/svgs/calendar-2.svg',
                  iconBackgroundColor: ColorsManager.surfaceBlue,
                  title: 'Date & Time',
                  lines: [dateLabel, '$startTime - $endTime'],
                ),
                verticalSpace(16),
                BookingInfoTile(
                  iconAsset: 'assets/svgs/clipboard-text.svg',
                  iconBackgroundColor: ColorsManager.surfaceGreen,
                  title: 'Appointment Type',
                  lines: [_typeLabels[state.selectedType] ?? ''],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
