import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/models/get_doctors_response_model.dart';
import 'package:flutter_complete_project/features/home/data/models/get_specialization_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/doctors_repo.dart';
import 'package:flutter_complete_project/features/home/ui/doctors/logic/doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final DoctorsRepo doctorsRepo;
  final int? specializationId;
  List<String> specialities = ['All'];
  List<DoctorModel> _allDoctors = [];
  String selectedSpeciality = 'All';

  DoctorsCubit({required this.doctorsRepo, this.specializationId})
    : super(const DoctorsState.initial());

  Future<void> fetchDoctors() async {
    emit(const DoctorsState.loading());
    final int? id = specializationId;
    final ApiResult<List<DoctorModel>> result = id == null
        ? await _fetchRecommandedDoctors()
        : await _fetchSpecialityDoctors(id);
    result.when(
      success: (doctors) => emit(DoctorsState.success(doctors)),
      failure: (error) => emit(DoctorsState.error(error)),
    );
  }

  Future<ApiResult<List<DoctorModel>>> _fetchRecommandedDoctors() async {
    final ApiResult<GetDoctorsResponseModel> result = await doctorsRepo
        .getRecommandedDoctors();
    return result.when(
      success: (response) {
        _allDoctors = response.doctors?.whereType<DoctorModel>().toList() ?? [];
        specialities = [
          'All',
          ..._allDoctors
              .map((d) => d.specialization?.name)
              .whereType<String>()
              .toSet(),
        ];
        return ApiResult.success(_allDoctors);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  Future<ApiResult<List<DoctorModel>>> _fetchSpecialityDoctors(int id) async {
    final ApiResult<GetSpecializationResponseModel> result = await doctorsRepo
        .getSpecialityDoctors(specializationId: id);
    return result.when(
      success: (response) {
        _allDoctors = response.specializationData.doctors ?? [];
        final name = response.specializationData.name;
        specialities = ['All', ?name];
        return ApiResult.success(_allDoctors);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  void sortDoctors(String speciality) {
    if (speciality == 'All') {
      selectedSpeciality = 'All';
      emit(DoctorsState.success(_allDoctors));
      return;
    }
    final filtered = _allDoctors
        .where((d) => d.specialization?.name == speciality)
        .toList();
    selectedSpeciality = speciality;
    emit(DoctorsState.success(filtered));
  }
}
