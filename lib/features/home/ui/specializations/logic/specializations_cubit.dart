import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/models/get_specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/specializations_repo.dart';
import 'package:flutter_complete_project/features/home/ui/specializations/logic/specializations_state.dart';

class SpecializationsCubit
    extends Cubit<SpecializationsState<GetSpecializationsResponseModel>> {
  final SpecializationsRepo specializationsRepo;
  SpecializationsCubit({required this.specializationsRepo})
    : super(SpecializationsState.initial());

  Future<void> getSpecializations() async {
    emit(SpecializationsState.loading());
    final ApiResult<GetSpecializationsResponseModel> getSpecializationsResult =
        await specializationsRepo.getSpecializations();
    getSpecializationsResult.when(
      success: (GetSpecializationsResponseModel response) =>
          emit(SpecializationsState.success(response)),
      failure: (error) => emit(SpecializationsState.error(error)),
    );
  }
}
