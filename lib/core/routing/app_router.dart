import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependancy_injection.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/logic/conversation_cubit.dart';
import 'package:flutter_complete_project/features/inbox/data/repos/inbox_repo.dart';
import 'package:flutter_complete_project/features/main/ui/logic/main_cubit.dart';
import 'package:flutter_complete_project/features/main/ui/main_page.dart';
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
import 'package:flutter_complete_project/features/inbox/data/models/conversation_model.dart';
import 'package:flutter_complete_project/features/inbox/ui/conversation/conversation_screen.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/personal_information_page.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/faq/faq_page.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/notification_settings/notification_settings_page.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/security/security_page.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/settings_page.dart';

class AppRouter {
  static GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>();
  static Route generateRoute(RouteSettings route) {
    final _ = route.arguments;

    switch (route.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider<MainCubit>(
            create: (context) => sl<MainCubit>(),
            child: const MainPage(),
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
          builder: (context) => BlocProvider<MainCubit>(
            create: (context) => sl<MainCubit>(),
            child: const MainPage(),
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
      case Routes.chatThreadScreen:
        final args = route.arguments as Map<String, dynamic>;
        final String currentUserId = args['currentUserId'] as String;
        final String receiverId = args['receiverId'] as String;
        final String receiverName = args['receiverName'] as String;
        final String receiverPhoto = args['receiverPhoto'] as String? ?? '';
        final String senderName = args['senderName'] as String? ?? '';
        final String senderPhoto = args['senderPhoto'] as String? ?? '';
        final String conversationId = ConversationModel.buildId(
          currentUserId,
          receiverId,
        );

        return MaterialPageRoute(
          builder: (_) => BlocProvider<ConversationCubit>(
            create: (_) => ConversationCubit(
              inboxRepo: sl<InboxRepo>(),
              currentUserId: currentUserId,
              conversationId: conversationId,
              receiverId: receiverId,
              senderInfo: ParticipantInfo(name: senderName, photo: senderPhoto),
              receiverInfo: ParticipantInfo(
                name: receiverName,
                photo: receiverPhoto,
              ),
            )..watchMessages(),
            child: ConversationScreen(
              receiverName: receiverName,
              receiverId: receiverId,
            ),
          ),
        );
      case Routes.specializationsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SpecializationsCubit>(
            create: (_) => sl<SpecializationsCubit>()..getSpecializations(),
            child: const SpecializationsScreen(),
          ),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case Routes.notificationSettingsScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationSettingsPage(),
        );
      case Routes.faqScreen:
        return MaterialPageRoute(builder: (_) => const FaqPage());
      case Routes.securityScreen:
        return MaterialPageRoute(builder: (_) => const SecurityPage());
      case Routes.personalInformationScreen:
        return MaterialPageRoute(
          builder: (_) => const PersonalInformationPage(),
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
