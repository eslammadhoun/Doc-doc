import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodTile extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            isSelected
                ? 'assets/svgs/radio-selected.svg'
                : 'assets/svgs/radio-unselected.svg',
            width: 20.r,
            height: 20.r,
          ),
          horizontalSpace(8),
          Text(label, style: TextStyles.font14MediumDarkBlue),
        ],
      ),
    );
  }
}
