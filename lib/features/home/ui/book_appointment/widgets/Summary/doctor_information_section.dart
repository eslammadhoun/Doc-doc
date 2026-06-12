import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/doctor_details/widgets/doctor_info_header.dart';

class DoctorInformationSection extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorInformationSection({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Doctor Information', style: TextStyles.font16SemiBoldDarkBlue),
        verticalSpace(16),
        DoctorInfoHeader(doctor: doctor),
      ],
    );
  }
}
