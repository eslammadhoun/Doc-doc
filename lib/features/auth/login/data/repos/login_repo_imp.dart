import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/core/networkingv2/api_service.dart';
import 'package:flutter_complete_project/features/auth/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/auth/login/data/models/login_response_body.dart';
import 'package:flutter_complete_project/features/auth/login/data/repos/login_repo.dart';

class LoginRepoImp implements LoginRepo {
  final ApiService _apiService;
  const LoginRepoImp(this._apiService);

  @override
  Future<ApiResult<LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      final LoginResponse loginResponse = await _apiService.login(
        loginRequestBody,
      );
      return ApiResult.success(loginResponse);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
