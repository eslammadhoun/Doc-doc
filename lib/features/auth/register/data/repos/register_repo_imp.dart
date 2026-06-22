import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/core/networkingv2/api_service.dart';
import 'package:flutter_complete_project/features/auth/register/data/models/register_request_body.dart';
import 'package:flutter_complete_project/features/auth/register/data/models/register_response_body.dart';
import 'package:flutter_complete_project/features/auth/register/data/repos/register_repo.dart';

class RegisterRepoImp implements RegisterRepo {
  final ApiService _apiService;
  const RegisterRepoImp(this._apiService);

  @override
  Future<ApiResult<RegisterResponse>> register(
    RegisterRequestBody registerRequest,
  ) async {
    try {
      final RegisterResponse registerResponse = await _apiService.register(
        registerRequest,
      );
      return ApiResult.success(registerResponse);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
