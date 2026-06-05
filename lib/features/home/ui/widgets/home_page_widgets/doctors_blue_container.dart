import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 197.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 167.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              image: const DecorationImage(
                image: AssetImage('assets/images/home_blue_pattern.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: TextStyles.font18WhiteMedium,
                ),
                verticalSpace(16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48.r),
                    ),
                  ),
                  onPressed: () =>
                      context.pushNamed(Routes.nearbyDoctorsScreen),
                  child: Text(
                    'Find Nearby',
                    style: TextStyles.font12RegularBlue,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 0,
            right: 10.w,
            child: Image.asset('assets/images/doctor_image.png', height: 197.h),
          ),
        ],
      ),
    );
  }
}
