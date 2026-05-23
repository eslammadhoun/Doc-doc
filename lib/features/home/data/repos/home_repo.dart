import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiService homeApiService;
  const HomeRepo({required this.homeApiService});

  Future<ApiResult<SpecializationsResponseModel>> getHomeData() async {
    try {
      final SpecializationsResponseModel response = await homeApiService
          .getHomeData();
      return ApiResult.success(response);
    } catch (e) {
      print('HomeRepo error: $e');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
