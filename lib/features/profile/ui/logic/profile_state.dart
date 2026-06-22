import 'package:flutter_complete_project/core/models/user_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

enum ProfileRequestStatus { initial, loading, success, failure }

@freezed
abstract class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default(ProfileRequestStatus.initial)
    ProfileRequestStatus getUserProfileStatus,
    @Default(ApiErrorModel()) ApiErrorModel getUserProfileErrorModel,
    UserModel? user,
    @Default(ProfileRequestStatus.initial) ProfileRequestStatus logoutStatus,
    @Default(ApiErrorModel()) ApiErrorModel logoutErrorModel,
  }) = _ProfileState;
}
