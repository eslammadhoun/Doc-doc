import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_state.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Summary/booking_info_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BookingDetailsInformationSection extends StatelessWidget {
  const BookingDetailsInformationSection({super.key});

  static const Map<AppointmentType, String> _typeLabels = {
    AppointmentType.inPerson: 'In Person',
    AppointmentType.videoCall: 'Video Call',
    AppointmentType.phoneCall: 'Phone Call',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Booking Information', style: TextStyles.font16SemiBoldDarkBlue),
        verticalSpace(24),
        BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
          builder: (context, state) {
            final date = DateTime.now().add(
              Duration(days: state.selectedDateIndex),
            );
            final dateLabel = DateFormat('EEEE, dd MMMM yyyy').format(date);
            final startTime = state.timeSlots.isNotEmpty
                ? state.timeSlots[state.selectedTimeIndex]
                : '';

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: ColorsManager.lighterGrey),
                    ),
                  ),
                  child: BookingInfoTile(
                    iconAsset: 'assets/svgs/calendar-2.svg',
                    iconBackgroundColor: ColorsManager.surfaceBlue,
                    title: 'Date & Time',
                    lines: [dateLabel, startTime],
                  ),
                ),
                verticalSpace(16),
                Container(
                  padding: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: ColorsManager.lighterGrey),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: BookingInfoTile(
                          iconAsset: 'assets/svgs/clipboard-text.svg',
                          iconBackgroundColor: ColorsManager.surfaceGreen,
                          title: 'Appointment Type',
                          lines: [_typeLabels[state.selectedType] ?? ''],
                        ),
                      ),
                      horizontalSpace(8),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: ColorsManager.mainBlue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                        ),
                        child: Text(
                          'Get Location',
                          style: TextStyles.font12MediumBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
