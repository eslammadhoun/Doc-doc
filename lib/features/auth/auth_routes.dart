import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/features/auth/login/ui/logic/login_cubit.dart';
import 'package:flutter_complete_project/features/auth/login/ui/login_screen.dart';
import 'package:flutter_complete_project/features/auth/onboarding/onboarding_screen.dart';
import 'package:flutter_complete_project/features/auth/register/ui/logic/register_cubit.dart';
import 'package:flutter_complete_project/features/auth/register/ui/register_screen.dart';

class AuthRoutes {
  static Route onBoarding() {
    return MaterialPageRoute(
      builder: (_) => const OnboardingScreen(),
    );
  }

  static Route login() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider<LoginCubit>(
        create: (_) => sl<LoginCubit>(),
        child: const LoginScreen(),
      ),
    );
  }

  static Route register() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider<RegisterCubit>(
        create: (_) => sl<RegisterCubit>(),
        child: const RegisterScreen(),
      ),
    );
  }
}
