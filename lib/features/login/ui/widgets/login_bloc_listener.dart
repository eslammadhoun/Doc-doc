import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            builder: (context) => Center(
              child: const CircularProgressIndicator(
                color: ColorsManager.darkBlue,
              ),
            ),
          ),
          success: (loginResponse) {
            context.pop();
            context.pushReplacementNamed(Routes.homeScreen);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(loginResponse.message)));
          },
          error: (error) {
            context.pop();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(error.getAllMessages())));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
