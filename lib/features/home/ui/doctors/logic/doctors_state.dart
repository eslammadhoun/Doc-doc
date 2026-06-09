import 'package:flutter_complete_project/core/models/doctor_model.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'doctors_state.freezed.dart';

@freezed
class DoctorsState with _$DoctorsState {
  const factory DoctorsState.initial() = _Initial;
  const factory DoctorsState.loading() = _Loading;
  const factory DoctorsState.success(List<DoctorModel> doctors) = _Success;
  const factory DoctorsState.error(ApiErrorModel error) = _Error;
}
