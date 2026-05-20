import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});
  static const List<Map<String, String>> speciality = [
    {'name': 'General', 'icon': 'assets/svgs/general_doctor.png'},
    {'name': 'Neurologic', 'icon': 'assets/svgs/neurologic_doctor.png'},
    {'name': 'Pediatric', 'icon': 'assets/svgs/pediatric_doctor.png'},
    {'name': 'Radiology', 'icon': 'assets/svgs/radiology_doctor.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Doctor Speciality', style: TextStyles.font18SemiBold),
            const Spacer(),
            Text('See All', style: TextStyles.font12RegularBlue),
          ],
        ),
        verticalSpace(16.h),
        SizedBox(
          height: 86.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => horizontalSpace(16.w),
            itemCount: speciality.length,
            itemBuilder: (context, index) => SizedBox(
              width: 73.w,
              height: 86.h,
              child: Column(
                children: [
                  Container(
                    width: 56.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: Color(0xffF4F8FF),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        speciality[index]['icon']!,
                        width: 24.w,
                      ),
                    ),
                  ),
                  verticalSpace(12),
                  Text(
                    speciality[index]['name']!,
                    style: TextStyles.font12RegularDarkBlue,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
