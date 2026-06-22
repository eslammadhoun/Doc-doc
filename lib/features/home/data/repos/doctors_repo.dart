import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/models/get_doctors_response_model.dart';
import 'package:flutter_complete_project/features/home/data/models/get_specialization_response_model.dart';

abstract class DoctorsRepo {
  Future<ApiResult<GetDoctorsResponseModel>> getRecommandedDoctors();
  Future<ApiResult<GetSpecializationResponseModel>> getSpecialityDoctors({
    required int? specializationId,
  });
  Future<ApiResult<GetDoctorsResponseModel>> searchDoctors({
    required String searchQuery,
  });
}
