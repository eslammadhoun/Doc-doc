import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/doctor_details_navbar.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/doctor_details_tabs.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/doctor_info_header.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/make_appointment_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: DoctorDetailsNavbar(doctorName: doctor.name ?? ''),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(8),
                    DoctorInfoHeader(doctor: doctor),
                    verticalSpace(32),
                    DoctorDetailsTabs(doctor: doctor),
                    verticalSpace(24),
                  ],
                ),
              ),
            ),
            MakeAppointmentButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.bookAppointmentScreen),
            ),
          ],
        ),
      ),
    );
  }
}
