import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/profile/data/models/get_profile_response_model.dart';
import 'package:flutter_complete_project/features/profile/data/models/update_profile_request_body.dart';

abstract class ProfileRepo {
  Future<ApiResult<GetProfileResponseModel>> getUserProfile();
  Future<ApiResult<void>> updateProfile(UpdateProfileRequestBody body);
  Future<ApiResult<void>> logout();
}
