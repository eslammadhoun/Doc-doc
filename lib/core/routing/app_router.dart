import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/auth/ui/login_screen.dart';
import 'package:flutter_complete_project/features/onboadring/onboarding_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings route) {
    final arguments = route.arguments;

    switch (route.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No Route Defined for ${route.name}')),
          ),
        );
    }
  }
}
