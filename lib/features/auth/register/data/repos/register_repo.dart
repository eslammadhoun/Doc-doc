import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/auth/register/data/models/register_request_body.dart';
import 'package:flutter_complete_project/features/auth/register/data/models/register_response_body.dart';

abstract class RegisterRepo {
  Future<ApiResult<RegisterResponse>> register(
    RegisterRequestBody registerRequest,
  );
}
