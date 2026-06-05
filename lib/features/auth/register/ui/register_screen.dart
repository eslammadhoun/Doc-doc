import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project/features/auth/register/data/models/register_request_body.dart';
import 'package:flutter_complete_project/features/auth/register/ui/widgets/register_bloc_listener.dart';
import 'package:flutter_complete_project/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:flutter_complete_project/features/auth/register/ui/widgets/register_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create Account', style: TextStyles.font24BoldBlue),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14Regular.copyWith(
                    color: ColorsManager.grey,
                  ),
                ),
                verticalSpace(36),
                Column(
                  children: [
                    RegisterForm(),
                    Align(
                      alignment: AlignmentGeometry.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13RegularBlue,
                      ),
                    ),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Register',
                      textStyle: TextStyles.font16SemiBold,
                      onPressed: () => validateThenRegister(context),
                    ),
                    verticalSpace(24),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'By registering, you agree to our ',
                            style: TextStyles.font13RegularGrey,
                          ),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyles.font13RegularDarkBlue,
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyles.font13RegularGrey,
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyles.font13RegularDarkBlue,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyles.font13RegularBlue.copyWith(
                            color: ColorsManager.grey,
                          ),
                        ),
                        InkWell(
                          onTap: () => context.pushNamed(Routes.loginScreen),
                          child: Text(
                            'Login',
                            style: TextStyles.font13RegularBlue,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(24),
                    RegisterBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenRegister(BuildContext context) {
    if (context
        .read<RegisterCubit>()
        .registerFormKey
        .currentState!
        .validate()) {
      context.read<RegisterCubit>().emitRegisterStates(
        registerRequestBody: RegisterRequestBody(
          name: context.read<RegisterCubit>().nameController.text,
          email: context.read<RegisterCubit>().emailController.text,
          password: context.read<RegisterCubit>().passwordController.text,
          phone: context.read<RegisterCubit>().phoneController.text,
          gender: context.read<RegisterCubit>().genderController.text,
        ),
      );
    }
  }
}
