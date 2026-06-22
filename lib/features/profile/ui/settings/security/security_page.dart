import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/notification_settings/widgets/notification_switch_item.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/security/widgets/security_chevron_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool _rememberPassword = true;
  bool _faceId = false;
  bool _pin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildNavbar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ListView(
                  children: [
                    SizedBox(height: 20.h),
                    NotificationSwitchItem(
                      title: 'Remember password',
                      value: _rememberPassword,
                      onChanged: (v) =>
                          setState(() => _rememberPassword = v),
                    ),
                    SizedBox(height: 12.h),
                    NotificationSwitchItem(
                      title: 'Face ID',
                      value: _faceId,
                      onChanged: (v) => setState(() => _faceId = v),
                    ),
                    SizedBox(height: 12.h),
                    NotificationSwitchItem(
                      title: 'PIN',
                      value: _pin,
                      onChanged: (v) => setState(() => _pin = v),
                    ),
                    SizedBox(height: 12.h),
                    SecurityChevronItem(
                      title: 'Google Authenticator',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavbar() {
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
          Text('Security', style: TextStyles.font18SemiBoldNearBlack),
          SizedBox(width: 40.w, height: 40.h),
        ],
      ),
    );
  }
}
