import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/ui/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/logic/home_state.dart';
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
              children: [
                const HomeTopBar(),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is Loading ||
                      current is Success ||
                      current is Error,
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (data) {
                        final SpecializationsResponseModel
                        specializationsResponseModel = data;
                        final List<DoctorModel?> listOfDoctors =
                            specializationsResponseModel
                                .listOfSpecializations![0]!
                                .doctors!;
                        return Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const DoctorsBlueContainer(),
                                verticalSpace(16),
                                const DoctorSpeciality(),
                                verticalSpace(23),
                                ListOfDoctors(listOfDoctors: listOfDoctors),
                              ],
                            ),
                          ],
                        );
                      },
                      error: (error) => Center(
                        child: Text(error.apiErrorModel.message ?? 'Error'),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
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
