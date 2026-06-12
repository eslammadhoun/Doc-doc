import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingConfirmedHeader extends StatelessWidget {
  const BookingConfirmedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svgs/booking-confirmed.svg',
          width: 78.r,
          height: 78.r,
        ),
        verticalSpace(20),
        Text('Booking Confirmed', style: TextStyles.font20MediumDarkBlue),
      ],
    );
  }
}
