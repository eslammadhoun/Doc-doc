import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/specialization_data_model.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpeciality extends StatelessWidget {
  final List<SpecializationData> listOfSpecializations;

  const DoctorSpeciality({super.key, required this.listOfSpecializations});

  static String specialityIcon(int index) {
    switch (index) {
      case 1:
        return 'general';
      case 2:
        return 'Neurology';
      case 3:
        return 'Pediatric';
      case 4:
        return 'pulmonary';
      default:
        return 'general';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Doctor Speciality', style: TextStyles.font18SemiBold),
            const Spacer(),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, Routes.specializationsScreen),
              child: Text('See All', style: TextStyles.font12RegularBlue),
            ),
          ],
        ),
        verticalSpace(16),
        SizedBox(
          height: 86.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => horizontalSpace(16),
            itemCount: listOfSpecializations.length,
            itemBuilder: (context, index) {
              final spec = listOfSpecializations[index];
              return InkWell(
                onTap: () => context.pushNamed(
                  Routes.doctorsScreen,
                  argumants: {
                    'specializationId': spec.id,
                    'specializationName': spec.name,
                  },
                ),
                child: SizedBox(
                  width: 73.w,
                  height: 86.h,
                  child: Column(
                    children: [
                      Container(
                        width: 56.w,
                        height: 56.h,
                        decoration: const BoxDecoration(
                          color: Color(0xffF4F8FF),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/${specialityIcon(index + 1)}.png',
                            width: 24.w,
                          ),
                        ),
                      ),
                      verticalSpace(12),
                      Text(
                        spec.name ?? 'Speciality',
                        style: TextStyles.font12RegularDarkBlue,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
