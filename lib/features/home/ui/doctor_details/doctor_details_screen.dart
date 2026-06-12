import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/doctor_details_navbar.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/doctor_details_tabs.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/doctor_info_header.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/give_rate_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final DoctorModel doctor;
  final int initialTabIndex;
  final bool showGiveRateSheet;

  const DoctorDetailsScreen({
    super.key,
    required this.doctor,
    this.initialTabIndex = 0,
    this.showGiveRateSheet = false,
  });

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.showGiveRateSheet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => const GiveRateSheet(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctor;
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
                    DoctorDetailsTabs(
                      doctor: doctor,
                      initialIndex: widget.initialTabIndex,
                    ),
                    verticalSpace(24),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
              child: AppTextButton(
                buttonText: 'Make An Appointment',
                textStyle: TextStyles.font16SemiBoldWhite,
                onPressed: () => Navigator.pushNamed(
                  context,
                  Routes.bookAppointmentScreen,
                  arguments: doctor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
