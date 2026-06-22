import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/auth/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/auth/login/data/models/login_response_body.dart';

abstract class LoginRepo {
  Future<ApiResult<LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  });
}
