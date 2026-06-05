import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/models/doctors_index_response_model.dart';

class NearbyDoctorsRepo {
  final HomeApiService homeApiService;
  const NearbyDoctorsRepo({required this.homeApiService});

  Future<ApiResult<DoctorsIndexResponseModel>> getNearbyDoctors() async {
    try {
      final response = await homeApiService.getNearbyDoctors();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
