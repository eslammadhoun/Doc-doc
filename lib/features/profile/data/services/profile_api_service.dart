import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networkingv2/api_constants.dart';
import 'package:flutter_complete_project/features/profile/data/models/get_profile_response_model.dart';
import 'package:flutter_complete_project/features/profile/data/models/update_profile_request_body.dart';
import 'package:flutter_complete_project/features/profile/data/services/profile_api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;
  @GET(ProfileApiConstants.getProfileEP)
  Future<GetProfileResponseModel> getUserProfile();
  @POST(ProfileApiConstants.updateProfileEP)
  Future<void> updateProfile(@Body() UpdateProfileRequestBody body);
  @POST(ProfileApiConstants.logoutEP)
  Future<void> logout();
}
