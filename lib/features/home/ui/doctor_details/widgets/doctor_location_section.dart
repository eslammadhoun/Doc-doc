import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorLocationSection extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorLocationSection({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final String practicePlace = [
      doctor.city?.name,
      doctor.city?.governrate?.name,
    ].whereType<String>().join(', ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Practice Place', style: TextStyles.font16SemiBoldDarkBlue),
        verticalSpace(12),
        Text(practicePlace, style: TextStyles.font14RegularGrey),
        verticalSpace(18),
        Text('Location Map', style: TextStyles.font16SemiBoldDarkBlue),
        verticalSpace(12),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: SizedBox(
            width: double.infinity,
            height: 258.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/map.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Icon(
                  Icons.location_on,
                  color: ColorsManager.secondaryRed,
                  size: 40.r,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
