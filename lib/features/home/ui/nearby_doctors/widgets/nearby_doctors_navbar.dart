import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearbyDoctorsNavbar extends StatelessWidget {
  const NearbyDoctorsNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white.withAlpha(0)],
                stops: [0.1, 1],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: SvgPicture.asset(
                      'assets/svgs/Chevron-left.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ),
                Text('Find Nearby', style: TextStyles.font18SemiBoldNearBlack),
                SizedBox(width: 40.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
