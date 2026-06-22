import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/auth/auth_routes.dart';
import 'package:flutter_complete_project/features/home/home_routes.dart';
import 'package:flutter_complete_project/features/inbox/inbox_routes.dart';
import 'package:flutter_complete_project/features/main/ui/logic/main_cubit.dart';
import 'package:flutter_complete_project/features/main/ui/main_page.dart';
import 'package:flutter_complete_project/features/profile/profile_routes.dart';

class AppRouter {
  static GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>();

  static Route generateRoute(RouteSettings route) {
    switch (route.name) {
      // Main
      case '/':
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<MainCubit>(
            create: (_) => sl<MainCubit>(),
            child: const MainPage(),
          ),
        );

      // Auth
      case Routes.onBoardingScreen:
        return AuthRoutes.onBoarding();
      case Routes.loginScreen:
        return AuthRoutes.login();
      case Routes.registerScreen:
        return AuthRoutes.register();

      // Home
      case Routes.notificationsPage:
        return HomeRoutes.notifications();
      case Routes.bookAppointmentScreen:
        return HomeRoutes.bookAppointment(route.arguments);
      case Routes.nearbyDoctorsScreen:
        return HomeRoutes.nearbyDoctors();
      case Routes.doctorsScreen:
        return HomeRoutes.doctors(route.arguments);
      case Routes.doctorDetailsScreen:
        return HomeRoutes.doctorDetails(route.arguments);
      case Routes.specializationsScreen:
        return HomeRoutes.specializations();

      // Inbox
      case Routes.chatThreadScreen:
        return InboxRoutes.chatThread(route.arguments);

      // Profile
      case Routes.settingsScreen:
        return ProfileRoutes.settings();
      case Routes.notificationSettingsScreen:
        return ProfileRoutes.notificationSettings();
      case Routes.faqScreen:
        return ProfileRoutes.faq();
      case Routes.securityScreen:
        return ProfileRoutes.security();
      case Routes.medicalRecordScreen:
        return ProfileRoutes.medicalRecord();
      case Routes.paymentScreen:
        return ProfileRoutes.payment();
      case Routes.personalInformationScreen:
        return ProfileRoutes.personalInformation(route.arguments);

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No Route Defined for ${route.name}')),
          ),
        );
    }
  }
}
