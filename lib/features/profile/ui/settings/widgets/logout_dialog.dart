import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependancy_injection.dart';
import 'package:flutter_complete_project/features/profile/ui/logic/profile_cubit.dart';
import 'package:flutter_complete_project/features/profile/ui/logic/profile_state.dart';

void showLogoutDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (_) => BlocProvider(
      create: (_) => sl<ProfileCubit>(),
      child: const _LogoutDialogContent(),
    ),
  );
}

class _LogoutDialogContent extends StatelessWidget {
  const _LogoutDialogContent();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          previous.logoutStatus != current.logoutStatus,
      listener: (context, state) {
        if (state.logoutStatus == ProfileRequestStatus.failure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.logoutErrorModel.getAllMessages())),
          );
        }
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) =>
            previous.logoutStatus != current.logoutStatus,
        builder: (context, state) {
          final isLoading = state.logoutStatus == ProfileRequestStatus.loading;

          return CupertinoAlertDialog(
            title: const Text('Logout'),
            content: const Text(
              "You'll need to enter your username\n"
              'and password next time\n'
              'you want to login',
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: isLoading ? null : () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: isLoading
                    ? null
                    : () => context.read<ProfileCubit>().logout(),
                child: isLoading
                    ? const CupertinoActivityIndicator()
                    : const Text('Logout'),
              ),
            ],
          );
        },
      ),
    );
  }
}
