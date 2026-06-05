import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, index) => Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(color: ColorsManager.mainBlue),
      ),
      separatorBuilder: (BuildContext context, index) =>
          const SizedBox(height: 5),
      itemCount: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
