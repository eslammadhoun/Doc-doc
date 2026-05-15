import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool isObscureText = true;

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
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email '),
                      verticalSpace(18),
                      AppTextFormField(
                        hintText: 'Password',
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
                        onPressed: () {},
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
                          Text('Sign Up', style: TextStyles.font13RegularBlue),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
