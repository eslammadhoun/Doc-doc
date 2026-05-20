import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctor_widget.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_speciality.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/home_top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeTopBar(),
                const DoctorsBlueContainer(),
                verticalSpace(16),
                const DoctorSpeciality(),
                verticalSpace(23),
                const ListOfDoctors(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListOfDoctors extends StatelessWidget {
  const ListOfDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Recommendation Doctors', style: TextStyles.font18SemiBold),
            const Spacer(),
            Text('See All', style: TextStyles.font12RegularBlue),
          ],
        ),
        verticalSpace(12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return DoctorWidget();
          },
        ),
      ],
    );
  }
}
