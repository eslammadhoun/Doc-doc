import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependancy_injection.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_project/features/home/ui/home/home_page.dart';
import 'package:flutter_complete_project/features/home/ui/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/book_appointment_screen.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/logic/nearby_doctors_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/nearby_doctors_screen.dart';
import 'package:flutter_complete_project/features/home/ui/notifications/notifications_page.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/logic/specializations_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/specializations_screen.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/logic/doctors_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/doctors_screen.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/doctor_details_screen.dart';
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
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HomeCubit>(
            create: (context) =>
                HomeCubit(homeRepo: sl<HomeRepo>())..getHomeData(),
            child: const HomePage(),
          ),
        );
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
        final DoctorModel doctor = route.arguments as DoctorModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<BookAppointmentCubit>(
            create: (context) => sl<BookAppointmentCubit>(param1: doctor),
            child: BookAppointmentScreen(doctor: doctor),
          ),
        );
      case Routes.nearbyDoctorsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<NearbyDoctorsCubit>(
            create: (context) => sl<NearbyDoctorsCubit>()..getNearbyDoctors(),
            child: const NearbyDoctorsScreen(),
          ),
        );
      case Routes.doctorsScreen:
        final Map<String, Object?>? arguments =
            route.arguments as Map<String, dynamic>?;
        final int? specializationId = arguments?['specializationId'] as int?;
        final String? specializationName =
            arguments?['specializationName'] as String?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<DoctorsCubit>(
            create: (_) =>
                sl<DoctorsCubit>(param1: specializationId)..fetchDoctors(),
            child: DoctorsScreen(specializationName: specializationName),
          ),
        );
      case Routes.doctorDetailsScreen:
        final DoctorModel doctor = route.arguments as DoctorModel;
        return MaterialPageRoute(
          builder: (_) => DoctorDetailsScreen(doctor: doctor),
        );
      case Routes.specializationsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SpecializationsCubit>(
            create: (_) => sl<SpecializationsCubit>()..getSpecializations(),
            child: const SpecializationsScreen(),
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
