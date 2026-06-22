import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodData {
  final String name;
  final String maskedNumber;
  final String iconPath;
  final bool isConnected;

  const PaymentMethodData({
    required this.name,
    required this.maskedNumber,
    required this.iconPath,
    this.isConnected = true,
  });
}

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethodData data;

  const PaymentMethodCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            offset: const Offset(0, -5),
            blurRadius: 15,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: SvgPicture.asset(data.iconPath, width: 40.w, height: 40.h),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name, style: TextStyles.font14MediumDarkBlue),
                SizedBox(height: 6.h),
                Text(
                  data.maskedNumber,
                  style: TextStyles.font10RegularTextSecondary,
                ),
              ],
            ),
          ),
          Text(
            data.isConnected ? 'Connected' : 'Connect',
            style: TextStyles.font14RegularDarkBlue.copyWith(
              color: ColorsManager.mainBlue,
            ),
          ),
        ],
      ),
    );
  }
}
