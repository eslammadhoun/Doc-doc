import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_complete_project/core/helpers/app_preferences.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:flutter_complete_project/core/networkingv2/dio_factory.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/auth/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/auth/login/data/models/login_response_body.dart';
import 'package:flutter_complete_project/features/auth/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/auth/login/ui/logic/login_state.dart'
    hide Success;

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void emitLoginStates({required LoginRequestBody loginRequestBody}) async {
    emit(const LoginState.loading());
    final ApiResult<LoginResponse> loginResponse = await loginRepo.login(
      loginRequestBody: loginRequestBody,
    );
    loginResponse.when(
      success: (LoginResponse loginResponse) async {
        final String token = loginResponse.userData?.token ?? '';
        await secureUserToken(token);
        await saveUserId(token);
        DioFactory.setTokenIntoHeadersAfterLogin(token);
        emit(LoginState.success(loginResponse));
      },
      failure: (error) => emit(LoginState.error(error)),
    );
  }

  // Safe User Token in Sharedprferences
  Future<void> secureUserToken(String token) async {
    await AppPreferences.setSecureString(Constants.userToken, token);
  }

  // Decode the JWT 'sub' claim and persist it as the current user id
  Future<void> saveUserId(String token) async {
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    final String userId = decodedToken['sub']?.toString() ?? '';
    await AppPreferences.saveData(Constants.userId, userId);
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
