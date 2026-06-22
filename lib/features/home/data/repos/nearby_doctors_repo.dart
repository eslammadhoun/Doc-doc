import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/home/data/models/get_doctors_response_model.dart';

abstract class NearbyDoctorsRepo {
  Future<ApiResult<GetDoctorsResponseModel>> getNearbyDoctors();
}
