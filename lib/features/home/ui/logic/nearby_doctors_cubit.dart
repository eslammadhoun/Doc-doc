import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/nearby_doctors_repo.dart';
import 'package:flutter_complete_project/features/home/ui/logic/nearby_doctors_state.dart';

class NearbyDoctorsCubit extends Cubit<NearbyDoctorsState> {
  final NearbyDoctorsRepo nearbyDoctorsRepo;

  NearbyDoctorsCubit({required this.nearbyDoctorsRepo})
      : super(const NearbyDoctorsState.initial());

  Future<void> getNearbyDoctors() async {
    emit(const NearbyDoctorsState.loading());
    final result = await nearbyDoctorsRepo.getNearbyDoctors();
    result.when(
      success: (response) {
        final doctors =
            response.doctors?.whereType<DoctorModel>().toList() ?? [];
        emit(NearbyDoctorsState.success(
          doctors,
          doctors.isNotEmpty ? doctors.first : null,
        ));
      },
      failure: (error) => emit(NearbyDoctorsState.error(error)),
    );
  }

  void selectDoctor(DoctorModel doctor) {
    state.maybeWhen(
      success: (doctors, _) =>
          emit(NearbyDoctorsState.success(doctors, doctor)),
      orElse: () {},
    );
  }
}
