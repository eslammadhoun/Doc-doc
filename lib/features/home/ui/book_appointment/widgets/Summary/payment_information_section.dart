import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentInformationSection extends StatelessWidget {
  const PaymentInformationSection({super.key});

  static const Map<CardType, String> _cardIcons = {
    CardType.masterCard: 'assets/svgs/mastercard.svg',
    CardType.americanExpress: 'assets/svgs/american-express.svg',
    CardType.capitalOne: 'assets/svgs/capital-one.svg',
    CardType.barclays: 'assets/svgs/barclays.svg',
  };

  static const Map<CardType, String> _cardLabels = {
    CardType.masterCard: 'Master Card',
    CardType.americanExpress: 'American Express',
    CardType.capitalOne: 'Capital One',
    CardType.barclays: 'Barclays',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Information', style: TextStyles.font16SemiBoldDarkBlue),
        verticalSpace(16),
        BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
          builder: (context, state) {
            final String iconAsset;
            final String label;
            final String maskedAccount;
            switch (state.selectedPaymentMethod) {
              case PaymentMethod.creditCard:
                iconAsset =
                    _cardIcons[state.selectedCardType] ??
                    'assets/svgs/mastercard.svg';
                label = _cardLabels[state.selectedCardType] ?? 'Credit Card';
                maskedAccount = '**** **** **** 4256';
                break;
              case PaymentMethod.bankTransfer:
                iconAsset = 'assets/svgs/clipboard-text.svg';
                label = 'Bank Transfer';
                maskedAccount = '**** **** **** 4256';
                break;
              case PaymentMethod.paypal:
                iconAsset = 'assets/svgs/paypal.svg';
                label = 'Paypal';
                maskedAccount = 'doe.john@example.com';
                break;
            }

            return Row(
              children: [
                SvgPicture.asset(iconAsset, width: 40.r, height: 40.r),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: TextStyles.font14SemiBoldDarkBlue),
                      verticalSpace(2),
                      Text(maskedAccount, style: TextStyles.font12RegularGrey),
                    ],
                  ),
                ),
                horizontalSpace(12),
                OutlinedButton(
                  onPressed: () =>
                      context.read<BookAppointmentCubit>().goToPaymentStep(),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: ColorsManager.mainBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                  ),
                  child: Text('Change', style: TextStyles.font12MediumBlue),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
