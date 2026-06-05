import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/logic/book_appointment_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentTypeSection extends StatelessWidget {
  const AppointmentTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<BookAppointmentCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Appointment Type', style: TextStyles.font16SemiBoldDarkBlue),
            verticalSpace(16),
            _AppointmentTypeOption(
              icon: Icons.people_outline,
              iconBgColor: ColorsManager.surfaceBlue,
              iconColor: ColorsManager.mainBlue,
              label: 'In Person',
              isSelected: state.selectedType == AppointmentType.inPerson,
              onTap: () => cubit.selectType(AppointmentType.inPerson),
            ),
            verticalSpace(16),
            _AppointmentTypeOption(
              icon: Icons.videocam_outlined,
              iconBgColor: ColorsManager.surfaceGreen,
              iconColor: const Color(0xFF22C55E),
              label: 'Video Call',
              isSelected: state.selectedType == AppointmentType.videoCall,
              onTap: () => cubit.selectType(AppointmentType.videoCall),
            ),
            verticalSpace(16),
            _AppointmentTypeOption(
              icon: Icons.phone_outlined,
              iconBgColor: ColorsManager.moreLighterGrey,
              iconColor: ColorsManager.mainBlue,
              label: 'Phone Call',
              isSelected: state.selectedType == AppointmentType.phoneCall,
              onTap: () => cubit.selectType(AppointmentType.phoneCall),
            ),
          ],
        );
      },
    );
  }
}

class _AppointmentTypeOption extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _AppointmentTypeOption({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorsManager.lighterGrey),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(icon, color: iconColor, size: 22.r),
            ),
            horizontalSpace(13),
            Expanded(
              child: Text(label, style: TextStyles.font14RegularDarkBlue),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: isSelected
                  ? ColorsManager.mainBlue
                  : ColorsManager.lighterGrey,
              size: 20.r,
            ),
          ],
        ),
      ),
    );
  }
}
