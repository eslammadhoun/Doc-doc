import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/models/get_specializations_response_model.dart';

class SpecializationsRepo {
  final HomeApiService homeApiService;
  const SpecializationsRepo({required this.homeApiService});

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
