import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildNavbar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    _buildAvatar(),
                    SizedBox(height: 50.h),
                    _buildFormFields(),
                    SizedBox(height: 24.h),
                    Text(
                      'When you set up your personal information settings, you should take care to provide accurate information.',
                      style: TextStyles.font12RegularGrey.copyWith(
                        color: ColorsManager.grey,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: ColorsManager.lighterGrey),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/Chevron-left.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.darkBlue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Personal information',
            style: TextStyles.font18SemiBoldNearBlack,
          ),
          SizedBox(width: 40.w, height: 40.h),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
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

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildTextField('Omar Ahmed'),
        SizedBox(height: 16.h),
        _buildTextField('omarahmed14@gmail.com'),
        SizedBox(height: 16.h),
        _buildTextField('Password', obscure: true),
        SizedBox(height: 16.h),
        _buildPhoneField(),
      ],
    );
  }

  Widget _buildTextField(String value, {bool obscure = false}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
      decoration: BoxDecoration(
        color: ColorsManager.moreLighterGrey,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.lighterGrey),
      ),
      child: Text(
        obscure ? '••••••••' : value,
        style: TextStyles.font14MediumDarkBlue,
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: ColorsManager.moreLighterGrey,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.lighterGrey),
      ),
      child: Row(
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
          Container(width: 1.w, height: 24.h, color: ColorsManager.lighterGrey),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              '+1 938756 878',
              style: TextStyles.font14MediumDarkBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: AppTextButton(
        buttonText: 'Save',
        textStyle: TextStyles.font16SemiBold,
        onPressed: () {},
      ),
    );
  }
}
