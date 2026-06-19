import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/models/get_doctors_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/doctors_repo.dart';
import 'package:flutter_complete_project/features/inbox/ui/new_message/logic/new_message_state.dart';

class NewMessageCubit extends Cubit<NewMessageState> {
  final DoctorsRepo doctorsRepo;
  List<DoctorModel> allDoctors = [];
  String currentSearchQuery = '';
  List<String> specialities = ['All'];
  String selectedSpeciality = 'All';
  NewMessageCubit({required this.doctorsRepo})
    : super(NewMessageState.initial());

  Future<void> fetchDoctors() async {
    emit(NewMessageState.loading());
    final ApiResult<GetDoctorsResponseModel> result = await doctorsRepo
        .getRecommandedDoctors();
    result.when(
      success: (response) {
        allDoctors = response.doctors?.whereType<DoctorModel>().toList() ?? [];
        specialities = [
          'All',
          ...allDoctors
              .map((doctor) => doctor.specialization?.name)
              .whereType<String>()
              .toSet(),
        ];
        emit(NewMessageState.success(allDoctors));
      },
      failure: (dynamic error) => emit(NewMessageState.error(error)),
    );
  }

  Future<void> searchDoctors({required String searchQuery}) async {
    currentSearchQuery = searchQuery;
    if (searchQuery.isEmpty) {
      sortDoctors(selectedSpeciality);
      return;
    }
    emit(NewMessageState.loading());
    final ApiResult<GetDoctorsResponseModel> result = await doctorsRepo
        .searchDoctors(searchQuery: searchQuery);
    result.when(
      success: (response) {
        List<DoctorModel> doctors =
            response.doctors?.whereType<DoctorModel>().toList() ?? [];
        if (selectedSpeciality != 'All') {
          doctors = doctors
              .where((d) => d.specialization?.name == selectedSpeciality)
              .toList();
        }
        emit(NewMessageState.success(doctors));
      },
      failure: (dynamic error) => emit(NewMessageState.error(error)),
    );
  }

  void sortDoctors(String speciality) {
    selectedSpeciality = speciality;
    if (currentSearchQuery.isNotEmpty) {
      searchDoctors(searchQuery: currentSearchQuery);
      return;
    }
    if (speciality == 'All') {
      emit(NewMessageState.success(allDoctors));
      return;
    }
    final filtered = allDoctors
        .where((d) => d.specialization?.name == speciality)
        .toList();
    emit(NewMessageState.success(filtered));
  }
}
