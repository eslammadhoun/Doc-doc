import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/models/home_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_project/features/home/ui/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState<HomeResponseModel>> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(HomeState.initial());

  Future<void> getHomeData() async {
    emit(HomeState.loading());
    final ApiResult<HomeResponseModel> getHomeDataResult = await homeRepo
        .getHomeData();
    getHomeDataResult.when(
      success: (HomeResponseModel response) =>
          emit(HomeState.success(response)),
      failure: (dynamic error) => emit(HomeState.error(error)),
    );
  }
}
