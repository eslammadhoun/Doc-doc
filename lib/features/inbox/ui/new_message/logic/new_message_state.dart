import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_message_state.freezed.dart';

@freezed
class NewMessageState with _$NewMessageState {
  const factory NewMessageState.initial() = _Initial;
  const factory NewMessageState.loading() = _Loading;
  const factory NewMessageState.success(List<DoctorModel> doctors) = _Success;
  const factory NewMessageState.error(ApiErrorModel error) = _Error;
}
