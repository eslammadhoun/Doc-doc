import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_state.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Payments/credit_card_option.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/widgets/Payments/payment_method_tile.dart';

class PaymentOptionSection extends StatelessWidget {
  const PaymentOptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Option', style: TextStyles.font16SemiBoldDarkBlue),
        verticalSpace(24),
        const CreditCardOption(),
        verticalSpace(24),
        BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
          builder: (context, state) {
            final cubit = context.read<BookAppointmentCubit>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaymentMethodTile(
                  label: 'Bank Transfer',
                  isSelected:
                      state.selectedPaymentMethod == PaymentMethod.bankTransfer,
                  onTap: () =>
                      cubit.selectPaymentMethod(PaymentMethod.bankTransfer),
                ),
                verticalSpace(24),
                PaymentMethodTile(
                  label: 'Paypal',
                  isSelected:
                      state.selectedPaymentMethod == PaymentMethod.paypal,
                  onTap: () => cubit.selectPaymentMethod(PaymentMethod.paypal),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
