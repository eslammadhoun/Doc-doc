import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:flutter_complete_project/features/auth/register/logic/cubit/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,

      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: ColorsManager.darkBlue),
            ),
          ),
          success: (registerResponse) {
            context.pop();
            context.pushReplacementNamed(Routes.homeScreen);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(registerResponse.message)));
          },
          error: (apiErrorModel) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(apiErrorModel.getAllMessages())),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
