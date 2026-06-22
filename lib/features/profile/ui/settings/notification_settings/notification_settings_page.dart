import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/notification_settings/widgets/notification_switch_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _notificationFromDocNow = true;
  bool _sound = true;
  bool _vibrate = true;
  bool _appUpdates = false;
  bool _specialOffers = true;

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
                      title: 'Notification from DocNow',
                      value: _notificationFromDocNow,
                      onChanged: (v) =>
                          setState(() => _notificationFromDocNow = v),
                    ),
                    SizedBox(height: 12.h),
                    NotificationSwitchItem(
                      title: 'Sound',
                      value: _sound,
                      onChanged: (v) => setState(() => _sound = v),
                    ),
                    SizedBox(height: 12.h),
                    NotificationSwitchItem(
                      title: 'Vibrate',
                      value: _vibrate,
                      onChanged: (v) => setState(() => _vibrate = v),
                    ),
                    SizedBox(height: 12.h),
                    NotificationSwitchItem(
                      title: 'App Updates',
                      value: _appUpdates,
                      onChanged: (v) => setState(() => _appUpdates = v),
                    ),
                    SizedBox(height: 12.h),
                    NotificationSwitchItem(
                      title: 'Special Offers',
                      value: _specialOffers,
                      onChanged: (v) => setState(() => _specialOffers = v),
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
          Text('Notification', style: TextStyles.font18SemiBoldNearBlack),
          SizedBox(width: 40.w, height: 40.h),
        ],
      ),
    );
  }
}
