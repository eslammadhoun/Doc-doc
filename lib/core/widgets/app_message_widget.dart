import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMessageWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color? iconColor;
  final String? actionLabel;
  final VoidCallback? onAction;

  const AppMessageWidget({
    super.key,
    required this.message,
    this.icon = Icons.error_outline_rounded,
    this.iconColor,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final color = iconColor ?? ColorsManager.mainBlue;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 36.sp, color: color),
          ),
          SizedBox(height: 16.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyles.font14MediumDarkBlue,
          ),
          if (actionLabel != null) ...[
            SizedBox(height: 24.h),
            AppTextButton(
              buttonText: actionLabel!,
              textStyle: TextStyles.font16SemiBold,
              buttonWidth: 160,
              onPressed: onAction ?? () {},
            ),
          ],
        ],
      ),
    );
  }
}
