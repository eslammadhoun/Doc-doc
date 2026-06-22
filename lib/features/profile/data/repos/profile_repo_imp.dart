import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/profile/data/models/get_profile_response_model.dart';
import 'package:flutter_complete_project/features/profile/data/models/update_profile_request_body.dart';
import 'package:flutter_complete_project/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_complete_project/features/profile/data/services/profile_api_service.dart';

class ProfileRepoImp implements ProfileRepo {
  final ProfileApiService profileApiService;
  const ProfileRepoImp({required this.profileApiService});

  @override
  Future<ApiResult<GetProfileResponseModel>> getUserProfile() async {
    try {
      final GetProfileResponseModel profileResponseModel =
          await profileApiService.getUserProfile();
      return ApiResult.success(profileResponseModel);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<void>> updateProfile(UpdateProfileRequestBody body) async {
    try {
      await profileApiService.updateProfile(body);
      // ignore: void_checks
      return ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<void>> logout() async {
    try {
      await profileApiService.logout();
      // ignore: void_checks
      return ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
