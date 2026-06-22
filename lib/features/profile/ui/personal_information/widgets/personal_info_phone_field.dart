import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoPhoneField extends StatelessWidget {
  final TextEditingController controller;

  const PersonalInfoPhoneField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      style: TextStyles.font14MediumDarkBlue,
      decoration: InputDecoration(
        hintText: 'Phone number',
        hintStyle: TextStyles.font14MediumLightGrey,
        filled: true,
        fillColor: ColorsManager.moreLighterGrey,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 17.h,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 8.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2.r),
                child: Image.asset(
                  'assets/images/profileImage.png',
                  width: 24.w,
                  height: 18.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18.sp,
                color: ColorsManager.darkBlue,
              ),
              SizedBox(width: 8.w),
              Container(
                width: 1.w,
                height: 24.h,
                color: ColorsManager.lighterGrey,
              ),
            ],
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.lighterGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.lighterGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: ColorsManager.mainBlue),
        ),
      ),
    );
  }
}
