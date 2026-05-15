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
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      buildWhen: (previous, current) => current is Loading,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => Center(
            child: CircularProgressIndicator(color: ColorsManager.darkBlue),
          ),
          success: (loginResponse) {
            context.pushNamed(Routes.homeScreen);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(loginResponse.message)));
          },
          error: (message) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message))),
        );
      },
      builder: (context, state) => state.maybeWhen(
        loading: () => Center(
          child: CircularProgressIndicator(color: ColorsManager.darkBlue),
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
