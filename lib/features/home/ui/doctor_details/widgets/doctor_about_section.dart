import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class DoctorAboutSection extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorAboutSection({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InfoBlock(title: 'About me', value: doctor.description ?? ''),
        verticalSpace(24),
        _InfoBlock(
          title: 'Working Time',
          value: '${doctor.startTime ?? ''} - ${doctor.endTime ?? ''}',
        ),
        verticalSpace(24),
        _InfoBlock(title: 'STR', value: doctor.degree ?? ''),
        verticalSpace(24),
        _InfoBlock(title: 'Pengalaman Praktik', value: doctor.city?.name ?? ''),
      ],
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String title;
  final String value;

  const _InfoBlock({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.font16SemiBoldDarkBlue),
        verticalSpace(12),
        Text(value, style: TextStyles.font14RegularGrey),
      ],
    );
  }
}
