import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_state.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/booking_details/booking_details_screen.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/appointment_navbar.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/appointment_stepper.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/DataAndTime/appointment_type_section.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/DataAndTime/date_picker_section.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/DataAndTime/time_slots_section.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Payments/payment_option_section.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Summary/booking_information_section.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Summary/doctor_information_section.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Summary/payment_information_section.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Summary/payment_summary_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointmentScreen extends StatelessWidget {
  final DoctorModel doctor;
  const BookAppointmentScreen({super.key, required this.doctor});

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
            BlocSelector<BookAppointmentCubit, BookAppointmentState, int>(
              selector: (state) => state.currentStep,
              builder: (context, currentStep) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: AppointmentStepper(currentStep: currentStep),
              ),
            ),
            Expanded(
              child:
                  BlocSelector<BookAppointmentCubit, BookAppointmentState, int>(
                    selector: (state) => state.currentStep,
                    builder: (context, currentStep) => SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: switch (currentStep) {
                        1 => Column(
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
                        2 => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(8),
                            const PaymentOptionSection(),
                          ],
                        ),
                        _ => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(8),
                            const BookingInformationSection(),
                            verticalSpace(24),
                            DoctorInformationSection(doctor: doctor),
                            verticalSpace(24),
                            const PaymentInformationSection(),
                            verticalSpace(24),
                          ],
                        ),
                      },
                    ),
                  ),
            ),
            BlocSelector<BookAppointmentCubit, BookAppointmentState, int>(
              selector: (state) => state.currentStep,
              builder: (context, currentStep) => currentStep == 3
                  ? PaymentSummarySheet(
                      subtotal: doctor.price ?? 0,
                      onBookNow: () {
                        final cubit = context.read<BookAppointmentCubit>();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: cubit,
                              child: BookingDetailsScreen(doctor: doctor),
                            ),
                          ),
                        );
                      },
                    )
                  : Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
                      child: AppTextButton(
                        buttonText: 'Continue',
                        textStyle: TextStyles.font16SemiBoldWhite,
                        onPressed: () {
                          if (currentStep == 1) {
                            context
                                .read<BookAppointmentCubit>()
                                .goToPaymentStep();
                          } else if (currentStep == 2) {
                            context
                                .read<BookAppointmentCubit>()
                                .goToSummaryStep();
                          }
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
