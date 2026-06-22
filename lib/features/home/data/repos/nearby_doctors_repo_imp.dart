import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/models/get_doctors_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/nearby_doctors_repo.dart';

class NearbyDoctorsRepoImp implements NearbyDoctorsRepo {
  final HomeApiService homeApiService;
  const NearbyDoctorsRepoImp({required this.homeApiService});

  @override
  Future<ApiResult<GetDoctorsResponseModel>> getNearbyDoctors() async {
    try {
      final response = await homeApiService.getNearbyDoctors();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
