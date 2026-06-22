import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_information_state.freezed.dart';

enum UpdateProfileStatus { initial, loading, success, failure }

@freezed
abstract class PersonalInformationState with _$PersonalInformationState {
  factory PersonalInformationState({
    @Default(UpdateProfileStatus.initial) UpdateProfileStatus updateStatus,
    @Default(ApiErrorModel()) ApiErrorModel updateErrorModel,
  }) = _PersonalInformationState;
}
