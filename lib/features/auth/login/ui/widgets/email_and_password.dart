import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_complete_project/features/auth/login/ui/logic/login_cubit.dart';
import 'package:flutter_complete_project/core/widgets/password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasDigits = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordListener();
    super.initState();
  }

  void setupPasswordListener() {
    passwordController.addListener(() {
      final password = passwordController.text;
      setState(() {
        hasLowercase = password.contains(RegExp(r'[a-z]'));
        hasUppercase = password.contains(RegExp(r'[A-Z]'));
        hasDigits = password.contains(RegExp(r'[0-9]'));
        hasSpecialCharacters = password.contains(
          RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
        );
        hasMinLength = password.length >= 8;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().loginFormKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
            },
            hintText: 'Password ',
            obscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowercase: hasLowercase,
            hasUppercase: hasUppercase,
            hasDigits: hasDigits,
            hasSpecialCharacters: hasSpecialCharacters,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
