import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_complete_project/core/widgets/password_validations.dart';
import 'package:flutter_complete_project/features/auth/register/ui/logic/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasDigits = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController genderController;

  @override
  void initState() {
    emailController = context.read<RegisterCubit>().emailController;
    passwordController = context.read<RegisterCubit>().passwordController;
    nameController = context.read<RegisterCubit>().nameController;
    phoneController = context.read<RegisterCubit>().phoneController;
    genderController = context.read<RegisterCubit>().genderController;
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
      key: context.read<RegisterCubit>().registerFormKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          verticalSpace(12),
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
          verticalSpace(12),
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
          verticalSpace(12),
          AppTextFormField(
            hintText: 'Phone',
            controller: phoneController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          verticalSpace(12),
          AppTextFormField(
            hintText: 'Gender',
            controller: genderController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your gender';
              }
              return null;
            },
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
