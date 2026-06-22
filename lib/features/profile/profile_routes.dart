import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/core/models/user_model.dart';
import 'package:flutter_complete_project/features/profile/ui/medical_record/medical_record_page.dart';
import 'package:flutter_complete_project/features/profile/ui/payment/payment_page.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/logic/personal_information_cubit.dart';
import 'package:flutter_complete_project/features/profile/ui/personal_information/personal_information_page.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/faq/faq_page.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/notification_settings/notification_settings_page.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/security/security_page.dart';
import 'package:flutter_complete_project/features/profile/ui/settings/settings_page.dart';

class ProfileRoutes {
  static Route settings() {
    return MaterialPageRoute(builder: (_) => const SettingsPage());
  }

  static Route notificationSettings() {
    return MaterialPageRoute(builder: (_) => const NotificationSettingsPage());
  }

  static Route faq() {
    return MaterialPageRoute(builder: (_) => const FaqPage());
  }

  static Route security() {
    return MaterialPageRoute(builder: (_) => const SecurityPage());
  }

  static Route medicalRecord() {
    return MaterialPageRoute(builder: (_) => const MedicalRecordPage());
  }

  static Route payment() {
    return MaterialPageRoute(builder: (_) => const PaymentPage());
  }

  static Route personalInformation(Object? arguments) {
    final user = arguments as UserModel;
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => sl<PersonalInformationCubit>(),
        child: PersonalInformationPage(user: user),
      ),
    );
  }
}
