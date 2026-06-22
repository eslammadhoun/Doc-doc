import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/main/ui/logic/main_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileActionLabels extends StatelessWidget {
  const ProfileActionLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: ColorsManager.profileLabelBg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<MainCubit>().changeTab(3);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  alignment: Alignment.center,
                  child: Text(
                    'My Appointment',
                    style: TextStyles.font12RegularDarkBlue,
                  ),
                ),
              ),
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              indent: 8.h,
              endIndent: 8.h,
              color: ColorsManager.lighterGrey,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.medicalRecordScreen),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  alignment: Alignment.center,
                  child: Text(
                    'Medical records',
                    style: TextStyles.font12RegularDarkBlue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
