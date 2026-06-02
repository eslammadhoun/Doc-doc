import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_project/features/home/ui/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(HomeState.initial());

  Future<void> getHomeData() async {
    emit(HomeState.loading());
    final ApiResult<SpecializationsResponseModel> getHomeDataResult =
        await homeRepo.getHomeData();
    getHomeDataResult.when(
      success: (SpecializationsResponseModel response) =>
          emit(HomeState.success(response)),
      failure: (ApiErrorModel error) => emit(HomeState.error(error)),
    );
  }
}
