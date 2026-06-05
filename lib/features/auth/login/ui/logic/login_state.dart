import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial<T>;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.error(ApiErrorModel error) = Error;
}
