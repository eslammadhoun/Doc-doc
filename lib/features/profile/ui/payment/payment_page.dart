import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/profile/ui/payment/widgets/payment_method_card.dart';
import 'package:flutter_complete_project/features/profile/ui/payment/widgets/payment_navbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  static const List<PaymentMethodData> _paymentMethods = [
    PaymentMethodData(
      name: 'Paypal',
      maskedNumber: '***** ***** ***** 37842',
      iconPath: 'assets/svgs/paypal.svg',
    ),
    PaymentMethodData(
      name: 'Master Card',
      maskedNumber: '***** ***** ***** 42482',
      iconPath: 'assets/svgs/mastercard.svg',
    ),
    PaymentMethodData(
      name: 'Apple Pay',
      maskedNumber: '***** ***** ***** 37476',
      iconPath: 'assets/svgs/applepay.svg',
    ),
    PaymentMethodData(
      name: 'Payoneer',
      maskedNumber: '***** ***** ***** 57643',
      iconPath: 'assets/svgs/payoneer.svg',
    ),
    PaymentMethodData(
      name: 'Dana',
      maskedNumber: '***** ***** ***** 10094',
      iconPath: 'assets/svgs/dana.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const PaymentNavbar(),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                itemCount: _paymentMethods.length,
                separatorBuilder: (_, _) => SizedBox(height: 12.h),
                itemBuilder: (_, index) =>
                    PaymentMethodCard(data: _paymentMethods[index]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.mainBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text('Add New', style: TextStyles.font16SemiBoldWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
