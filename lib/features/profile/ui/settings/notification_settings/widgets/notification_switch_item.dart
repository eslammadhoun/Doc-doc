import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationSwitchItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationSwitchItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorsManager.lighterGrey, width: 1.h),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: Text(title, style: TextStyles.font14RegularDarkBlue)),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: Colors.white,
              activeTrackColor: ColorsManager.mainBlue,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: const Color(0xFFD9DEE2),
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
