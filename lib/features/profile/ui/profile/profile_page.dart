import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_message_widget.dart';
import 'package:flutter_complete_project/features/profile/ui/logic/profile_cubit.dart';
import 'package:flutter_complete_project/features/profile/ui/logic/profile_state.dart';
import 'package:flutter_complete_project/features/profile/ui/profile/widgets/profile_action_labels.dart';
import 'package:flutter_complete_project/features/profile/ui/profile/widgets/profile_header.dart';
import 'package:flutter_complete_project/features/profile/ui/profile/widgets/profile_menu_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.mainBlue,
      child: Stack(
        children: [
          Positioned(
            top: 192.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
            ),
          ),
          Column(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen: (previous, current) =>
                    previous.getUserProfileStatus !=
                    current.getUserProfileStatus,
                builder: (context, state) {
                  return switch (state.getUserProfileStatus) {
                    ProfileRequestStatus.loading ||
                    ProfileRequestStatus.initial => Column(
                      children: [
                        const ProfileHeader(),
                        SizedBox(height: 72.h),
                        SizedBox(
                          height: 40.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                    ProfileRequestStatus.failure => Column(
                      children: [
                        const ProfileHeader(),
                        SizedBox(height: 72.h),
                        AppMessageWidget(
                          message: state.getUserProfileErrorModel
                              .getAllMessages(),
                          actionLabel: 'Retry',
                          onAction: () =>
                              context.read<ProfileCubit>().getUserProfile(),
                        ),
                      ],
                    ),
                    ProfileRequestStatus.success => Column(
                      children: [
                        const ProfileHeader(),
                        SizedBox(height: 72.h),
                        Text(
                          state.user?.name ?? '',
                          style: TextStyles.font20SemiBoldNearBlack,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          state.user?.email ?? '',
                          style: TextStyles.font14RegularDarkBlue.copyWith(
                            color: ColorsManager.darkBlue.withValues(
                              alpha: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  };
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      const ProfileActionLabels(),
                      SizedBox(height: 40.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          children: [
                            ProfileMenuItem(
                              iconPath: 'assets/svgs/personalcard.svg',
                              iconBackgroundColor: ColorsManager.surfaceBlue,
                              title: 'Personal Information',
                              onTap: () {},
                            ),
                            SizedBox(height: 16.h),
                            ProfileMenuItem(
                              iconPath: 'assets/svgs/directbox-notif.svg',
                              iconBackgroundColor: ColorsManager.surfaceGreen,
                              title: 'My Test & Diagnostic',
                              onTap: () {},
                            ),
                            SizedBox(height: 16.h),
                            ProfileMenuItem(
                              iconPath: 'assets/svgs/wallet-2.svg',
                              iconBackgroundColor: ColorsManager.surfaceRed,
                              title: 'Payment',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 132.h,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.w),
                    ),
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
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.personalInformationScreen,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(7.w),
                        decoration: BoxDecoration(
                          color: ColorsManager.profileLabelBg,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.w,
                          ),
                        ),
                        child: SvgPicture.asset(
                          'assets/svgs/edit-icon.svg',
                          width: 16.w,
                          height: 16.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
