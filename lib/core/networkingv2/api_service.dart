import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networkingv2/api_constants.dart';
import 'package:flutter_complete_project/features/auth/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/auth/login/data/models/login_response_body.dart';
import 'package:flutter_complete_project/features/auth/register/data/models/register_request_body.dart';
import 'package:flutter_complete_project/features/auth/register/data/models/register_response_body.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponse> login(@Body() LoginRequestBody body);

  @POST(ApiConstants.registerEndpoint)
  Future<RegisterResponse> register(@Body() RegisterRequestBody body);
}
