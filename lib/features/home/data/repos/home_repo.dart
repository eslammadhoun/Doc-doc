import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/models/home_response_model.dart';

class HomeRepo {
  final HomeApiService homeApiService;
  const HomeRepo({required this.homeApiService});

  Future<ApiResult<HomeResponseModel>> getHomeData() async {
    try {
      final HomeResponseModel response = await homeApiService.getHomeData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
