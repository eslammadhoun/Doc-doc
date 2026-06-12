import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentNavbar extends StatelessWidget {
  const AppointmentNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            final cubit = context.read<BookAppointmentCubit>();
            if (cubit.state.currentStep == 3) {
              cubit.goToPaymentStep();
            } else if (cubit.state.currentStep == 2) {
              cubit.goToDateTimeStep();
            } else {
              Navigator.of(context).pop();
            }
          },
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
        Text('Book Appointment', style: TextStyles.font18SemiBold),
        SizedBox(width: 40.r),
      ],
    );
  }
}
