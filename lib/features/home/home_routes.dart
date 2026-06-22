import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/book_appointment_screen.dart';
import 'package:flutter_complete_project/features/home/ui/book_appointment/logic/book_appointment_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/doctor_details_screen.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/doctors_screen.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/logic/doctors_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/logic/nearby_doctors_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/nearby_doctors_screen.dart';
import 'package:flutter_complete_project/features/home/ui/notifications/notifications_page.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/logic/specializations_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/specializations_screen.dart';

class HomeRoutes {
  static Route notifications() {
    return MaterialPageRoute(builder: (_) => NotificationsPage());
  }

  static Route bookAppointment(Object? arguments) {
    final DoctorModel doctor = arguments as DoctorModel;
    return MaterialPageRoute(
      builder: (_) => BlocProvider<BookAppointmentCubit>(
        create: (_) => sl<BookAppointmentCubit>(param1: doctor),
        child: BookAppointmentScreen(doctor: doctor),
      ),
    );
  }

  static Route nearbyDoctors() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider<NearbyDoctorsCubit>(
        create: (_) => sl<NearbyDoctorsCubit>()..getNearbyDoctors(),
        child: const NearbyDoctorsScreen(),
      ),
    );
  }

  static Route doctors(Object? arguments) {
    final Map<String, Object?>? args = arguments as Map<String, dynamic>?;
    final int? specializationId = args?['specializationId'] as int?;
    final String? specializationName =
        args?['specializationName'] as String?;
    return MaterialPageRoute(
      builder: (_) => BlocProvider<DoctorsCubit>(
        create: (_) =>
            sl<DoctorsCubit>(param1: specializationId)..fetchDoctors(),
        child: DoctorsScreen(specializationName: specializationName),
      ),
    );
  }

  static Route doctorDetails(Object? arguments) {
    final DoctorModel doctor = arguments as DoctorModel;
    return MaterialPageRoute(
      builder: (_) => DoctorDetailsScreen(doctor: doctor),
    );
  }

  static Route specializations() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider<SpecializationsCubit>(
        create: (_) => sl<SpecializationsCubit>()..getSpecializations(),
        child: const SpecializationsScreen(),
      ),
    );
  }
}
