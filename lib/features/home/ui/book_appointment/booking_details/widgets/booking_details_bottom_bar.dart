import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/doctor_details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingDetailsBottomBar extends StatelessWidget {
  final DoctorModel doctor;

  const BookingDetailsBottomBar({super.key, required this.doctor});

  static const int _reviewsTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
      child: AppTextButton(
        buttonText: 'Done',
        textStyle: TextStyles.font16SemiBoldWhite,
        onPressed: () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => DoctorDetailsScreen(
              doctor: doctor,
              initialTabIndex: _reviewsTabIndex,
              showGiveRateSheet: true,
            ),
          ),
          (route) => route.isFirst,
        ),
      ),
    );
  }
}
