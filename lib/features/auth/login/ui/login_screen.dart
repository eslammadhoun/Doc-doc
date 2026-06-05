import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project/features/auth/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/auth/login/ui/logic/login_cubit.dart';
import 'package:flutter_complete_project/features/auth/login/ui/widgets/email_and_password.dart';
import 'package:flutter_complete_project/features/auth/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                Text('Welcome Back', style: TextStyles.font24BoldBlue),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14Regular.copyWith(
                    color: ColorsManager.grey,
                  ),
                ),
                verticalSpace(36),
                Column(
                  children: [
                    EmailAndPassword(),
                    Align(
                      alignment: AlignmentGeometry.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13RegularBlue,
                      ),
                    ),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16SemiBold,
                      onPressed: () => validateThenLogin(context),
                    ),
                    verticalSpace(24),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'By logging in, you agree to our ',
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
                          'Don\'t have an account? ',
                          style: TextStyles.font13RegularBlue.copyWith(
                            color: ColorsManager.grey,
                          ),
                        ),
                        InkWell(
                          onTap: () => context.pushNamed(Routes.registerScreen),
                          child: Text(
                            'Sign Up',
                            style: TextStyles.font13RegularBlue,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(24),
                    LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().loginFormKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        loginRequestBody: LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }
}
