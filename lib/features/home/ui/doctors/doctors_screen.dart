import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/widgets/app_message_widget.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/logic/doctors_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/logic/doctors_state.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/widgets/doctor_card.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/widgets/doctors_navbar.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/widgets/doctors_search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsScreen extends StatelessWidget {
  final String? specializationName;
  const DoctorsScreen({super.key, this.specializationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            DoctorsNavbar(specializationName: specializationName),
            verticalSpace(20),
            const DoctorsSearchBar(),
            verticalSpace(16),
            Expanded(
              child: BlocBuilder<DoctorsCubit, DoctorsState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: state.maybeWhen(
                          loading: () => Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.mainBlue,
                            ),
                          ),
                          success: (doctors) {
                            if (doctors.isEmpty) {
                              return Center(
                                child: AppMessageWidget(
                                  message: 'No Doctors Found',
                                  actionLabel: 'Retry',
                                  onAction: () =>
                                      context.read<DoctorsCubit>().retry(),
                                ),
                              );
                            }
                            return ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              itemCount: doctors.length,
                              separatorBuilder: (_, _) => verticalSpace(12),
                              itemBuilder: (context, index) =>
                                  DoctorCard(doctor: doctors[index]),
                            );
                          },
                          error: (error) => Center(
                            child: AppMessageWidget(
                              message: error.getAllMessages(),
                              actionLabel: 'Retry',
                              onAction: () =>
                                  context.read<DoctorsCubit>().retry(),
                            ),
                          ),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
