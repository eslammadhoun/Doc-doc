import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_complete_project/core/widgets/app_message_widget.dart';
import 'package:flutter_complete_project/features/home/data/models/home_response_model.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/logic/nearby_doctors_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/logic/nearby_doctors_state.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/widgets/doctor_map_pin.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/widgets/nearby_doctor_card.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/widgets/nearby_doctors_navbar.dart';
import 'package:flutter_complete_project/features/home/ui/nearby_doctors/widgets/nearby_doctors_search_bar.dart';

class NearbyDoctorsScreen extends StatelessWidget {
  const NearbyDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<NearbyDoctorsCubit, NearbyDoctorsState>(
          builder: (context, state) {
            return state.when(
              initial: () => _mapShell(child: const SizedBox.shrink()),
              loading: () => _mapShell(
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  ),
                ),
              ),
              success: (doctors, selectedDoctor) => _mapShell(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (doctors.isEmpty)
                      Center(
                        child: AppMessageWidget(
                          message: 'No Nearby Doctors Found..',
                          actionLabel: 'Retry',
                          onAction: () => context
                              .read<NearbyDoctorsCubit>()
                              .getNearbyDoctors(),
                        ),
                      )
                    else ...[
                      _pin(
                        context,
                        doctors,
                        0,
                        const Alignment(-0.80, -0.36),
                        selectedDoctor,
                      ),
                      _pin(
                        context,
                        doctors,
                        1,
                        const Alignment(0.14, 0.32),
                        selectedDoctor,
                      ),
                      _pin(
                        context,
                        doctors,
                        2,
                        const Alignment(0.46, -0.62),
                        selectedDoctor,
                      ),
                      _pin(
                        context,
                        doctors,
                        3,
                        const Alignment(0.60, -0.02),
                        selectedDoctor,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: NearbyDoctorCard(doctor: selectedDoctor),
                      ),
                    ],
                  ],
                ),
              ),
              error: (error) => _mapShell(
                child: Center(
                  child: AppMessageWidget(
                    message: error.getAllMessages(),
                    actionLabel: 'Retry',
                    onAction: () =>
                        context.read<NearbyDoctorsCubit>().getNearbyDoctors(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _mapShell({required Widget child}) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/map.png', fit: BoxFit.cover),
        const Align(alignment: Alignment(0, -1), child: NearbyDoctorsNavbar()),
        const Align(
          alignment: Alignment(0, -0.85),
          child: NearbyDoctorsSearchBar(),
        ),
        child,
      ],
    );
  }

  Widget _pin(
    BuildContext context,
    List<DoctorModel> doctors,
    int index,
    Alignment alignment,
    DoctorModel? selectedDoctor,
  ) {
    if (index >= doctors.length) return const SizedBox.shrink();
    final doctor = doctors[index];
    return Align(
      alignment: alignment,
      child: DoctorMapPin(
        imageUrl: doctor.photo,
        isSelected: selectedDoctor?.id == doctor.id,
        onTap: () => context.read<NearbyDoctorsCubit>().selectDoctor(doctor),
      ),
    );
  }
}
