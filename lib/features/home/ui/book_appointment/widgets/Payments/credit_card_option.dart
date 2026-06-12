import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_state.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Payments/card_method_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCardOption extends StatelessWidget {
  const CreditCardOption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<BookAppointmentCubit>();
        final isCreditCard =
            state.selectedPaymentMethod == PaymentMethod.creditCard;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => cubit.selectPaymentMethod(PaymentMethod.creditCard),
              child: SvgPicture.asset(
                isCreditCard
                    ? 'assets/svgs/radio-selected.svg'
                    : 'assets/svgs/radio-unselected.svg',
                width: 20.r,
                height: 20.r,
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Credit Card', style: TextStyles.font14SemiBoldDarkBlue),
                  verticalSpace(24),
                  Column(
                    children: [
                      CardMethodTile(
                        iconAsset: 'assets/svgs/mastercard.svg',
                        label: 'Master Card',
                        onTap: () => cubit.selectCardType(CardType.masterCard),
                      ),
                      verticalSpace(12),
                      CardMethodTile(
                        iconAsset: 'assets/svgs/american-express.svg',
                        label: 'American Express',
                        onTap: () =>
                            cubit.selectCardType(CardType.americanExpress),
                      ),
                      verticalSpace(12),
                      CardMethodTile(
                        iconAsset: 'assets/svgs/capital-one.svg',
                        label: 'Capital One',
                        onTap: () => cubit.selectCardType(CardType.capitalOne),
                      ),
                      verticalSpace(12),
                      CardMethodTile(
                        iconAsset: 'assets/svgs/barclays.svg',
                        label: 'Barclays',
                        showDivider: false,
                        onTap: () => cubit.selectCardType(CardType.barclays),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
