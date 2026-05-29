import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_preferences.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/dio_factory.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/models/login_response_body.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart'
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
        DioFactory.setTokenIntoHeadersAfterLogin(token);
        emit(LoginState.success(loginResponse));
      },
      failure: (ErrorHandler error) =>
          emit(LoginState.error(error.apiErrorModel.message ?? 'Login Error')),
    );
  }

  // Safe User Token in Sharedprferences
  Future<void> secureUserToken(String token) async {
    await AppPreferences.setSecureString(Constants.userToken, token);
  }
}
