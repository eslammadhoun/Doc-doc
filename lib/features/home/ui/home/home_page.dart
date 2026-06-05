import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_message_widget.dart';
import 'package:flutter_complete_project/features/home/data/models/home_response_model.dart';
import 'package:flutter_complete_project/features/home/ui/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/home/logic/home_state.dart';
import 'package:flutter_complete_project/features/home/ui/home/widgets/doctor_widget.dart';
import 'package:flutter_complete_project/features/home/ui/home/widgets/doctors_blue_container.dart';
import 'package:flutter_complete_project/features/home/ui/home/widgets/doctors_speciality.dart';
import 'package:flutter_complete_project/features/home/ui/home/widgets/home_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
          child: Column(
            children: [
              const HomeTopBar(),
              verticalSpace(16),
              Expanded(
                child: BlocConsumer<HomeCubit, HomeState>(
                  listenWhen: (previous, current) => current is Error,
                  listener: (context, state) {
                    state.whenOrNull(
                      error: (error) => AppMessageWidget(
                        message: error.getAllMessages(),
                        actionLabel: 'Retry',
                        onAction: () {
                          context.read<HomeCubit>().getHomeData();
                        },
                      ),
                    );
                  },
                  buildWhen: (previous, current) =>
                      current is Loading ||
                      current is Success ||
                      current is Error,
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                        ),
                      ),
                      success: (data) {
                        final specializations = data.listOfSpecializations;
                        if (specializations == null ||
                            specializations.isEmpty) {
                          return const Center(
                            child: AppMessageWidget(
                              message: 'No Specializations Found',
                            ),
                          );
                        }
                        final List<DoctorModel?> listOfDoctors =
                            specializations[0]?.doctors ?? [];
                        if (listOfDoctors.isEmpty) {
                          return const Center(
                            child: AppMessageWidget(
                              message: 'No Doctors Found',
                            ),
                          );
                        }
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const DoctorsBlueContainer(),
                              verticalSpace(16),
                              DoctorSpeciality(
                                listOfSpecializations: specializations,
                              ),
                              verticalSpace(23),
                              ListOfDoctors(listOfDoctors: listOfDoctors),
                            ],
                          ),
                        );
                      },
                      error: (error) {
                        return Center(
                          child: AppMessageWidget(
                            message: error.getAllMessages(),
                            actionLabel: 'Retry',
                            onAction: () {
                              context.read<HomeCubit>().getHomeData();
                            },
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListOfDoctors extends StatelessWidget {
  final List<DoctorModel?> listOfDoctors;
  const ListOfDoctors({super.key, required this.listOfDoctors});

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
          itemCount: listOfDoctors.length,
          itemBuilder: (context, index) {
            return DoctorWidget(doctorModel: listOfDoctors[index]!);
          },
        ),
      ],
    );
  }
}
