import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfoAvatar extends StatelessWidget {
  const PersonalInfoAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 120.w,
            height: 120.h,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profileImage.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                color: ColorsManager.surfaceGrey,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.w),
              ),
              child: SvgPicture.asset(
                'assets/svgs/edit-profile.svg',
                width: 16.w,
                height: 16.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
