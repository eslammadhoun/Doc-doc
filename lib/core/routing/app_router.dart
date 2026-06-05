import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependancy_injection.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_project/features/home/ui/home/home_page.dart';
import 'package:flutter_complete_project/features/home/ui/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/book_appointment_screen.dart';
import 'package:flutter_complete_project/features/book_appointment/ui/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/logic/nearby_doctors_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/nearby_doctors_screen.dart';
import 'package:flutter_complete_project/features/home/ui/notifications/notifications_page.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/specializations_screen.dart';
import 'package:flutter_complete_project/features/home/data/models/home_response_model.dart';
import 'package:flutter_complete_project/features/auth/login/ui/logic/login_cubit.dart';
import 'package:flutter_complete_project/features/auth/login/ui/login_screen.dart';
import 'package:flutter_complete_project/features/auth/onboarding/onboarding_screen.dart';
import 'package:flutter_complete_project/features/auth/register/ui/logic/register_cubit.dart';
import 'package:flutter_complete_project/features/auth/register/ui/register_screen.dart';

class AppRouter {
  static GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>();
  static Route generateRoute(RouteSettings route) {
    final _ = route.arguments;

    switch (route.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LoginCubit>(
            create: (BuildContext context) => sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<RegisterCubit>(
            create: (BuildContext context) => sl<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HomeCubit>(
            create: (context) =>
                HomeCubit(homeRepo: sl<HomeRepo>())..getHomeData(),
            child: const HomePage(),
          ),
        );
      case Routes.notificationsPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => NotificationsPage(),
        );
      case Routes.bookAppointmentScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<BookAppointmentCubit>(
            create: (context) => sl<BookAppointmentCubit>(),
            child: const BookAppointmentScreen(),
          ),
        );
      case Routes.nearbyDoctorsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<NearbyDoctorsCubit>(
            create: (context) => sl<NearbyDoctorsCubit>()..getNearbyDoctors(),
            child: const NearbyDoctorsScreen(),
          ),
        );
      case Routes.specializationsScreen:
        final specializations =
            route.arguments as List<SpecializationData>;
        return MaterialPageRoute(
          builder: (_) => SpecializationsScreen(
            specializations: specializations,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No Route Defined for ${route.name}')),
          ),
        );
    }
  }
}
