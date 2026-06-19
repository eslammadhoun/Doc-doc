import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/image_widget.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorWidget extends StatelessWidget {
  final DoctorModel doctorModel;
  const DoctorWidget({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.doctorDetailsScreen,
        arguments: doctorModel,
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(8.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withAlpha(10),
              blurRadius: 100,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 110.w,
              height: 110.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: AppCachedImage(imageUrl: doctorModel.photo ?? ''),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    doctorModel.name ?? 'Doctor Name',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font16BoldDarkBlue,
                  ),
                  verticalSpace(8),
                  Text(
                    '${doctorModel.specialization?.name ?? 'general'} | ${doctorModel.degree}',
                    style: TextStyles.font11MediumGrey,
                  ),
                  verticalSpace(12),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/magic-star.svg',
                        width: 18.5.w,
                      ),
                      horizontalSpace(3),
                      Text(
                        '4.8 (4,279 reviews)',
                        style: TextStyles.font12MediumGray,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
