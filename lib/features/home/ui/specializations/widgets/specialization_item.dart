import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/specialization_data_model.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationItem extends StatelessWidget {
  final SpecializationData specialization;

  const SpecializationItem({super.key, required this.specialization});

  static const Set<String> _knownSpecializations = {
    'General',
    'ENT',
    'Pediatric',
    'Urologist',
    'Dentistry',
    'intestine',
    'histologist',
    'Hepatology',
    'cardiologist',
    'Neurology',
    'pulmonary',
    'Optometry',
  };

  String get _iconPath {
    final name = specialization.name;
    if (name == null) return 'assets/images/general.png';
    final match = _knownSpecializations.firstWhere(
      (s) => s.toLowerCase() == name.toLowerCase(),
      orElse: () => 'general',
    );
    return 'assets/images/$match.png';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.doctorsScreen,
        argumants: {
          'specializationId': specialization.id,
          'specializationName': specialization.name,
        },
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: const BoxDecoration(
              color: ColorsManager.specialityIconBg,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                _iconPath,
                width: 40.w,
                height: 40.h,
                errorBuilder: (_, _, _) => Icon(
                  Icons.medical_services_outlined,
                  color: ColorsManager.mainBlue,
                  size: 24.r,
                ),
              ),
            ),
          ),
          verticalSpace(12),
          Text(
            specialization.name ?? '',
            style: TextStyles.font12RegularDarkBlue,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
