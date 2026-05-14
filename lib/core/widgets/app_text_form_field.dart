import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.formFieldColor,
  });

  final EdgeInsetsGeometry? contentPadding;

  final InputBorder? focusedBorder;

  final InputBorder? enabledBorder;

  final TextStyle? inputTextStyle;

  final TextStyle? hintStyle;

  final String hintText;

  final Widget? suffixIcon;

  final bool? obscureText;
  final Color? formFieldColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: formFieldColor ?? ColorsManager.moreLighterGrey,
        filled: true,
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.mainBlue,
                width: 1.3.w,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.lighterGrey,
                width: 1.3.w,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
        hintStyle: hintStyle ?? TextStyles.font14RegularLightGrey,
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixIconColor: (obscureText != null && obscureText == true)
            ? ColorsManager.grey
            : ColorsManager.mainBlue,
      ),
      obscureText: obscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14MediumDarkBlue,
    );
  }
}
