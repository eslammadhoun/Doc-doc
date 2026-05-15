import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasDigits;
  final bool hasSpecialCharacters;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasDigits,
    required this.hasSpecialCharacters,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          text: 'At least 8 characters',
          isValid: hasMinLength,
        ),
        verticalSpace(2),
        buildValidationRow(
          text: 'At least one lowercase letter',
          isValid: hasLowercase,
        ),
        verticalSpace(2),
        buildValidationRow(
          text: 'At least one uppercase letter',
          isValid: hasUppercase,
        ),
        verticalSpace(2),
        buildValidationRow(text: 'At least one digit', isValid: hasDigits),
        verticalSpace(2),
        buildValidationRow(
          text: 'At least one special character',
          isValid: hasSpecialCharacters,
        ),
      ],
    );
  }

  Widget buildValidationRow({required String text, required bool isValid}) {
    return Row(
      children: [
        CircleAvatar(radius: 2.5.r, backgroundColor: ColorsManager.grey),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13RegularDarkBlue.copyWith(
            decoration: isValid ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: isValid ? ColorsManager.grey : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
