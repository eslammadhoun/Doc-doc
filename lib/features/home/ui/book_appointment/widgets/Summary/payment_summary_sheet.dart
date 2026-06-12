import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSummarySheet extends StatelessWidget {
  final double subtotal;
  final VoidCallback onBookNow;

  const PaymentSummarySheet({
    super.key,
    required this.subtotal,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    final tax = subtotal * 0.05;
    final total = subtotal + tax;

    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.lighterGrey,
            blurRadius: 8.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Payment Info', style: TextStyles.font16SemiBoldDarkBlue),
          verticalSpace(16),
          _SummaryRow(
            label: 'Subtotal',
            value: '\$${subtotal.toStringAsFixed(2)}',
          ),
          verticalSpace(8),
          _SummaryRow(label: 'Tax', value: '\$${tax.toStringAsFixed(2)}'),
          verticalSpace(16),
          Container(height: 1.h, color: ColorsManager.lighterGrey),
          verticalSpace(16),
          _SummaryRow(
            label: 'Payment Total',
            value: '\$${total.toStringAsFixed(2)}',
            labelStyle: TextStyles.font14SemiBoldDarkBlue,
            valueStyle: TextStyles.font18SemiBold,
          ),
          verticalSpace(16),
          AppTextButton(
            buttonText: 'Book Now',
            textStyle: TextStyles.font16SemiBoldWhite,
            onPressed: onBookNow,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: labelStyle ?? TextStyles.font12MediumTextSecondary),
        Text(value, style: valueStyle ?? TextStyles.font14SemiBoldDarkBlue),
      ],
    );
  }
}
