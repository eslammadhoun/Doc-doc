import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/app_preferences.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/core/networkingv2/dio_factory.dart';
import 'package:flutter_complete_project/features/register/data/models/register_request_body.dart';
import 'package:flutter_complete_project/features/register/data/models/register_response_body.dart';
import 'package:flutter_complete_project/features/register/data/repos/register_repo.dart';
import 'package:flutter_complete_project/features/register/logic/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit({required this.registerRepo})
    : super(const RegisterState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  Future<void> emitRegisterStates({
    required RegisterRequestBody registerRequestBody,
  }) async {
    emit(const RegisterState.loading());
    final ApiResult<RegisterResponse> result = await registerRepo.register(
      registerRequestBody,
    );

    result.when(
      success: (registerResponse) async {
        final String token = registerResponse.userData?.token ?? '';
        await secureUserToken(token);
        DioFactory.setTokenIntoHeadersAfterLogin(token);
        emit(RegisterState.success(registerResponse));
      },
      failure: (errorModel) => emit(RegisterState.error(errorModel)),
    );
  }

  Future<void> secureUserToken(String token) async {
    await AppPreferences.setSecureString(Constants.userToken, token);
  }
}
