import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingDetailsNavbar extends StatelessWidget {
  const BookingDetailsNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorsManager.lighterGrey),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/Chevron-left.svg',
                width: 20.r,
                height: 20.r,
              ),
            ),
          ),
        ),
        Text('Details', style: TextStyles.font18SemiBold),
        SizedBox(width: 40.r),
      ],
    );
  }
}
