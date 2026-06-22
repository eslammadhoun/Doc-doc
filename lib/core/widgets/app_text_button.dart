import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final Widget? child;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? ColorsManager.mainBlue,
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.0.w,
            vertical: verticalPadding?.h ?? 14.0.h,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius?.r ?? 16.0.r),
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.infinity, buttonHeight?.h ?? 52.0.h),
        ),
      ),
      onPressed: onPressed,
      child: child ?? Text(buttonText, style: textStyle),
    );
  }
}
