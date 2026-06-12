import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentStepper extends StatelessWidget {
  final int currentStep;

  const AppointmentStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStep(1, 'Date & Time'),
        _buildDivider(),
        _buildStep(2, 'Payment'),
        _buildDivider(),
        _buildStep(3, 'Summary'),
      ],
    );
  }

  Widget _buildStep(int step, String label) {
    final bool isActive = step == currentStep;
    final bool isFinished = currentStep > step;
    return Column(
      children: [
        Container(
          width: 32.r,
          height: 32.r,
          decoration: BoxDecoration(
            color: isFinished
                ? ColorsManager.secondaryGreen
                : isActive
                ? ColorsManager.mainBlue
                : ColorsManager.mediumGrey,
            borderRadius: BorderRadius.circular(16.r),
          ),
          alignment: Alignment.center,
          child: Text('$step', style: TextStyles.font12MediumWhite),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: TextStyles.font10RegularDarkBlue.copyWith(
            color: isFinished
                ? ColorsManager.secondaryGreen
                : isActive
                ? ColorsManager.mainBlue
                : ColorsManager.mediumGrey,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Container(
        width: 49.w,
        height: 2.h,
        color: ColorsManager.lighterGrey,
      ),
    );
  }
}
