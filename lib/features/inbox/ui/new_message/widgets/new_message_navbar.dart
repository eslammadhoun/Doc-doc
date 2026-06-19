import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewMessageNavbar extends StatelessWidget {
  const NewMessageNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Icon(Icons.close, size: 24.r, color: ColorsManager.darkBlue),
        ),
        Expanded(
          child: Center(
            child: Text('Create New Message', style: TextStyles.font18SemiBold),
          ),
        ),
        SizedBox(width: 24.w),
      ],
    );
  }
}
