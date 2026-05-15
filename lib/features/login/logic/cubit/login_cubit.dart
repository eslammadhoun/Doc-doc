import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_handler.dart';
import 'package:flutter_complete_project/core/networkingv2/api_result.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/models/login_response_body.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart'
    hide Success;

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(const LoginState.initial());

  void emitLoginStates({required LoginRequestBody loginRequestBody}) async {
    emit(const LoginState.loading());
    final ApiResult<LoginResponse> loginResponse = await loginRepo.login(
      loginRequestBody: loginRequestBody,
    );
    loginResponse.when(
      success: (LoginResponse loginResponse) =>
          emit(LoginState.success(loginResponse)),
      failure: (ErrorHandler error) =>
          emit(LoginState.error(error.apiErrorModel.message ?? 'Login Error')),
    );
  }
}
