import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/models/get_specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/specializations_repo.dart';

class SpecializationsRepoImp implements SpecializationsRepo {
  final HomeApiService homeApiService;
  const SpecializationsRepoImp({required this.homeApiService});

  @override
  Future<ApiResult<GetSpecializationsResponseModel>>
  getSpecializations() async {
    try {
      final GetSpecializationsResponseModel specializationsResponseModel =
          await homeApiService.getSpecializations();
      return ApiResult.success(specializationsResponseModel);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
