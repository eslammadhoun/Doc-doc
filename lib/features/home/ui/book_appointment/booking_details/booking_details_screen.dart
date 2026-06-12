import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/booking_details/widgets/booking_confirmed_header.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/booking_details/widgets/booking_details_bottom_bar.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/booking_details/widgets/booking_details_information_section.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/booking_details/widgets/booking_details_navbar.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Summary/doctor_information_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingDetailsScreen extends StatelessWidget {
  final DoctorModel doctor;

  const BookingDetailsScreen({super.key, required this.doctor});

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
              child: const BookingDetailsNavbar(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(40),
                    const Center(child: BookingConfirmedHeader()),
                    verticalSpace(40),
                    const BookingDetailsInformationSection(),
                    verticalSpace(24),
                    DoctorInformationSection(doctor: doctor),
                    verticalSpace(24),
                  ],
                ),
              ),
            ),
            BookingDetailsBottomBar(doctor: doctor),
          ],
        ),
      ),
    );
  }
}
