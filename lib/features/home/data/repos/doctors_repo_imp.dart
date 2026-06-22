import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_project/features/home/data/models/get_doctors_response_model.dart';
import 'package:flutter_complete_project/features/home/data/models/get_specialization_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/doctors_repo.dart';

class DoctorsRepoImp implements DoctorsRepo {
  final HomeApiService homeApiService;
  const DoctorsRepoImp({required this.homeApiService});

  @override
  Future<ApiResult<GetDoctorsResponseModel>> getRecommandedDoctors() async {
    try {
      final response = await homeApiService.getRecommandedDoctors();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<GetSpecializationResponseModel>> getSpecialityDoctors({
    required int? specializationId,
  }) async {
    try {
      final GetSpecializationResponseModel response = await homeApiService
          .getSpecialityDoctors(specializationId: specializationId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<GetDoctorsResponseModel>> searchDoctors({
    required String searchQuery,
  }) async {
    try {
      final GetDoctorsResponseModel searchResult = await homeApiService
          .searchDoctors(searchQuery: searchQuery);
      return ApiResult.success(searchResult);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
