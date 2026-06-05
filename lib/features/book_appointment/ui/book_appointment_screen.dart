import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/widgets/book_appointment_widgets/appointment_navbar.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/widgets/book_appointment_widgets/appointment_stepper.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/widgets/book_appointment_widgets/appointment_type_section.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/widgets/book_appointment_widgets/date_picker_section.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/widgets/book_appointment_widgets/time_slots_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: const AppointmentNavbar(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: const AppointmentStepper(currentStep: 1),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(8),
                    const DatePickerSection(),
                    verticalSpace(24),
                    const TimeSlotsSection(),
                    verticalSpace(24),
                    const AppointmentTypeSection(),
                    verticalSpace(24),
                  ],
                ),
              ),
            ),
            _ContinueButton(
              onPressed: () {
                // TODO: navigate to step 2 (Payment) when implemented
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ContinueButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
      child: SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.mainBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            elevation: 0,
          ),
          child: Text('Continue', style: TextStyles.font16SemiBoldWhite),
        ),
      ),
    );
  }
}
